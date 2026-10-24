#!/usr/bin/env python3
"""
sheets_sync.py - Minimal, deterministic I/O utility for Google Sheets tracking and deduplication.
Does NOT make subjective decisions. Reads past applications to prevent duplicates and appends newly tailored applications.
"""

import os
import sys
import json
import argparse
from pathlib import Path
from datetime import datetime

# Optional YAML loader
try:
    import yaml
except ImportError:
    yaml = None

def load_config():
    candidates = [Path("data/config.yaml"), Path("data/config.example.yaml")]
    for p in candidates:
        if p.exists() and yaml:
            with open(p, "r", encoding="utf-8") as f:
                return yaml.safe_load(f)
    return {}

def get_client(creds_path: str):
    import gspread
    from google.oauth2.service_account import Credentials

    scopes = [
        "https://www.googleapis.com/auth/spreadsheets",
        "https://www.googleapis.com/auth/drive"
    ]
    if not os.path.exists(creds_path):
        raise FileNotFoundError(f"Credentials file not found at: {creds_path}")
    
    credentials = Credentials.from_service_account_file(creds_path, scopes=scopes)
    return gspread.authorize(credentials)

def get_worksheet(config: dict):
    gs_cfg = config.get("google_sheets", {})
    if not gs_cfg.get("enabled", False):
        return None
    
    sheet_id = gs_cfg.get("spreadsheet_id")
    worksheet_name = gs_cfg.get("worksheet_name", "Applications")
    creds_path = gs_cfg.get("credentials_path", "credentials.json")

    client = get_client(creds_path)
    sheet = client.open_by_key(sheet_id)
    try:
        return sheet.worksheet(worksheet_name)
    except Exception:
        # Default to first sheet
        return sheet.sheet1

def load_local_cache():
    cache_path = Path("data/applications.json")
    if cache_path.exists():
        try:
            with open(cache_path, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            return []
    return []

def save_local_cache(records):
    cache_path = Path("data/applications.json")
    cache_path.parent.mkdir(parents=True, exist_ok=True)
    with open(cache_path, "w", encoding="utf-8") as f:
        json.dump(records, f, indent=2)

def fetch_applied(config: dict):
    """Returns a list of applied applications from Google Sheets or local cache."""
    gs_cfg = config.get("google_sheets", {})
    if gs_cfg.get("enabled", False):
        try:
            ws = get_worksheet(config)
            if ws:
                all_values = ws.get_all_values()
                # Find header row dynamically
                header_idx = -1
                for i, row in enumerate(all_values[:20]):
                    lowered = [str(cell).strip().lower() for cell in row]
                    if any("company" in h for h in lowered):
                        header_idx = i
                        break

                if header_idx != -1:
                    headers = [str(cell).strip() for cell in all_values[header_idx]]
                    records = []
                    for r in all_values[header_idx + 1:]:
                        if any(r):
                            row_dict = {}
                            for col_i, h in enumerate(headers):
                                if h and col_i < len(r):
                                    row_dict[h] = r[col_i]
                            if row_dict.get("Company Name") or row_dict.get("Company") or row_dict.get("company"):
                                records.append(row_dict)
                    save_local_cache(records)
                    return records
                else:
                    records = ws.get_all_records()
                    save_local_cache(records)
                    return records
        except Exception as e:
            sys.stderr.write(f"Google Sheets sync warning ({e}). Falling back to local cache.\n")
    return load_local_cache()

def is_duplicate(company: str, role: str, config: dict) -> bool:
    applied = fetch_applied(config)
    company_clean = company.strip().lower()
    role_clean = role.strip().lower()
    
    for row in applied:
        c = str(row.get("Company", row.get("Company Name", row.get("company", "")))).strip().lower()
        r = str(row.get("Role", row.get("role", ""))).strip().lower()
        if company_clean and c and (company_clean in c or c in company_clean):
            # Check role similarity
            if not role_clean or any(term in r for term in ["intern", "co-op", "swe", "software", "engineer"]):
                return True
    return False

def append_application(data: dict, config: dict):
    """Appends an application to both Google Sheets and local cache."""
    # 1. Update local cache
    local = load_local_cache()
    data["timestamp"] = datetime.now().isoformat()
    local.append(data)
    save_local_cache(local)

    # 2. Append to Google Sheets if enabled
    gs_cfg = config.get("google_sheets", {})
    if gs_cfg.get("enabled", False):
        try:
            ws = get_worksheet(config)
            if ws:
                # Order columns
                row = [
                    data.get("company", ""),
                    data.get("role", ""),
                    data.get("location", ""),
                    data.get("url", ""),
                    data.get("status", "Tailored"),
                    datetime.now().strftime("%Y-%m-%d"),
                    data.get("score", ""),
                    data.get("resume_path", ""),
                    data.get("notes", "")
                ]
                ws.append_row(row)
                print(f"✅ Appended to Google Sheet: {data.get('company')} - {data.get('role')}")
                return True
        except Exception as e:
            sys.stderr.write(f"Error appending to Google Sheet: {e}\n")
            return False
    else:
        print(f"Logged to local data/applications.json: {data.get('company')} - {data.get('role')}")
        return True

def main():
    parser = argparse.ArgumentParser(description="Google Sheets Sync & Deduplication Tool")
    parser.add_argument("--check-duplicate", action="store_true", help="Check if an application is already in the tracker")
    parser.add_argument("--fetch-applied", action="store_true", help="List all tracked applications")
    parser.add_argument("--append", action="store_true", help="Append a newly tailored application")
    parser.add_argument("--test-connection", action="store_true", help="Test Google Sheets credentials and connection")
    
    parser.add_argument("--company", type=str, default="")
    parser.add_argument("--role", type=str, default="")
    parser.add_argument("--location", type=str, default="")
    parser.add_argument("--url", type=str, default="")
    parser.add_argument("--status", type=str, default="Tailored")
    parser.add_argument("--score", type=str, default="")
    parser.add_argument("--resume-path", type=str, default="")
    parser.add_argument("--notes", type=str, default="")

    args = parser.parse_args()
    config = load_config()

    if args.test_connection:
        try:
            ws = get_worksheet(config)
            if ws:
                title = ws.spreadsheet.title
                print(f"✅ Successfully connected to Google Sheet: '{title}' (Tab: '{ws.title}')")
            else:
                print("ℹ️ Google Sheets is currently disabled in data/config.yaml (using local tracking).")
        except Exception as e:
            print(f"❌ Failed to connect to Google Sheets: {e}")
            sys.exit(1)

    elif args.fetch_applied:
        applied = fetch_applied(config)
        print(json.dumps(applied, indent=2))

    elif args.check_duplicate:
        if not args.company:
            print("Error: --company is required for --check-duplicate")
            sys.exit(1)
        duplicate = is_duplicate(args.company, args.role, config)
        if duplicate:
            print(f"DUPLICATE: Application for '{args.company}' already exists in tracker.")
            sys.exit(2)
        else:
            print(f"CLEAR: No existing application found for '{args.company}'.")
            sys.exit(0)

    elif args.append:
        if not args.company:
            print("Error: --company is required for --append")
            sys.exit(1)
        data = {
            "company": args.company,
            "role": args.role,
            "location": args.location,
            "url": args.url,
            "status": args.status,
            "score": args.score,
            "resume_path": args.resume_path,
            "notes": args.notes
        }
        append_application(data, config)

    else:
        parser.print_help()

if __name__ == "__main__":
    main()
