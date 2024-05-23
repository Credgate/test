#!/bin/bash

# This script generates Markdown documentation using gomarkdoc and converts it to HTML using pandoc.

# Redirect output to stderr.
exec 1>&2

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if gomarkdoc is installed, if not, install it
if ! command_exists gomarkdoc; then
  echo "Installing gomarkdoc..."
  go install github.com/princjef/gomarkdoc/cmd/gomarkdoc@latest
  echo "gomarkdoc installed."
fi

# Check if pandoc is installed
if ! command_exists pandoc; then
  echo "Pandoc is not installed."

  # Check the operating system
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing pandoc for macOS..."
    brew install pandoc
  elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    echo "Installing pandoc for Windows..."
    choco install pandoc
  else
    echo "Unsupported operating system. Please install Pandoc manually from https://pandoc.org/installing.html"
    exit 1
  fi

  if ! command_exists pandoc; then
    echo "Failed to install pandoc. Please install it manually from https://pandoc.org/installing.html"
    exit 1
  else
    echo "Pandoc installed successfully."
  fi
fi

# Generate Markdown documentation using gomarkdoc
gomarkdoc --output ./docs/docs.md .

# Convert Markdown to HTML using pandoc
pandoc ./docs/docs.md --toc --metadata title="My Package - User Docs" -c https://unpkg.com/sakura.css/css/sakura.css --standalone -o docs/documentation.html

exit 0