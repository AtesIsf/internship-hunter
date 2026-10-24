#!/usr/bin/env bash
set -e

echo "=== Setting up Internship Hunter Environment ==="

# 1. Virtual Environment
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment in .venv/..."
    python3 -m venv .venv
fi

echo "Installing Python dependencies..."
./.venv/bin/pip install --upgrade pip
./.venv/bin/pip install -r requirements.txt

# 2. Typst Binary Setup
if ! command -v typst &> /dev/null && [ ! -f "bin/typst" ]; then
    echo "Downloading standalone Typst compiler..."
    mkdir -p bin
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
        TYPST_ARCH="x86_64-unknown-linux-musl"
    elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
        TYPST_ARCH="aarch64-unknown-linux-musl"
    else
        TYPST_ARCH="x86_64-unknown-linux-musl"
    fi

    LATEST_URL=$(curl -s https://api.github.com/repos/typst/typst/releases/latest | grep "browser_download_url" | grep "$TYPST_ARCH" | head -n 1 | cut -d '"' -f 4)
    if [ -n "$LATEST_URL" ]; then
        curl -sL "$LATEST_URL" | tar -xJ --strip-components=1 -C bin "typst-$TYPST_ARCH/typst"
        chmod +x bin/typst
        echo "Typst installed into bin/typst"
    else
        echo "Warning: Could not auto-download Typst. Please install typst via your package manager."
    fi
else
    echo "Typst is already installed."
fi

# 3. Create initial data and output directories
mkdir -p data output
if [ ! -f "data/config.yaml" ] && [ -f "data/config.example.yaml" ]; then
    cp data/config.example.yaml data/config.yaml
    echo "Created data/config.yaml from example template."
fi

echo "=== Setup complete! ==="
