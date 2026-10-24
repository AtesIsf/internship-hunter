#!/usr/bin/env bash
# compile_resume.sh - Compiles Typst source to PDF and enforces 1-page budget.
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <input.typ> [output.pdf]"
    exit 1
fi

INPUT_TYP="$1"
OUTPUT_PDF="${2:-${INPUT_TYP%.typ}.pdf}"

# Determine typst executable
if command -v typst &> /dev/null; then
    TYPST_BIN="typst"
elif [ -f "./bin/typst" ]; then
    TYPST_BIN="./bin/typst"
elif [ -f "/home/ates-isf/Projects/internship-hunter/bin/typst" ]; then
    TYPST_BIN="/home/ates-isf/Projects/internship-hunter/bin/typst"
else
    echo "Error: typst binary not found. Run ./setup.sh or install typst."
    exit 1
fi

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT_PDF")"

# Compile Typst to PDF
"$TYPST_BIN" compile "$INPUT_TYP" "$OUTPUT_PDF"

# Verify 1-page requirement using pdfinfo if available
if command -v pdfinfo &> /dev/null; then
    PAGE_COUNT=$(pdfinfo "$OUTPUT_PDF" | grep "Pages:" | awk '{print $2}')
    if [ "$PAGE_COUNT" -gt 1 ]; then
        echo "================================================================="
        echo "❌ WARNING: Resume is $PAGE_COUNT pages! (Strict 1-page budget exceeded)"
        echo "Action required by Agent: Reduce vertical spacing, trim 1-2 bullet points,"
        echo "or tighten word count so it fits on exactly 1 page."
        echo "================================================================="
        exit 2
    else
        echo "✅ Resume successfully compiled: $OUTPUT_PDF (1 page, valid layout)"
    fi
else
    echo "✅ Resume compiled: $OUTPUT_PDF"
fi
