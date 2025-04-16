#!/bin/bash

# Author: Himanshu Parashar
# Purpose: Install and manage multiple versions of Golang
# Supports: Debian/Ubuntu, RHEL/CentOS, Fedora, Rocky, AlmaLinux
# Usage: ./install_golang.sh <version>
# Example: ./install_golang.sh 1.21.5
# ✅ Examples of Supported Versions (as of April 2025):
# You can install versions like:
#    1.22.1
#    1.21.5
#    1.20.10
#    1.19.13
#    1.18.10
#    1.17.13
#    ... all the way back to 1.1, technically.

set -e

GO_DIR="/usr/local/go"

# Function to check if wget is installed
check_and_install_wget() {
  if ! command -v wget &>/dev/null; then
    echo "❌ wget not found, installing..."
    if [ -f /etc/redhat-release ]; then
      # For RHEL/CentOS/Fedora/AlmaLinux
      sudo yum install wget -y
    elif [ -f /etc/debian_version ]; then
      # For Debian/Ubuntu
      sudo apt update && sudo apt install wget -y
    else
      echo "❌ Unsupported OS. Please install wget manually."
      exit 1
    fi
  fi
}

# Function to get the latest stable Go version
get_latest_go_version() {
  curl -s https://go.dev/VERSION?m=text | grep -oE 'go[0-9]+\.[0-9]+(\.[0-9]+)?'
}

# Determine version to install
if [ -z "$1" ]; then
  echo "ℹ️  No Go version provided. Fetching latest stable version..."
  GO_TAG=$(get_latest_go_version)
  GO_VERSION="${GO_TAG//go/}"
else
  GO_VERSION="$1"
fi

GO_ARCHIVE="go${GO_VERSION}.linux-amd64.tar.gz"
DOWNLOAD_URL="https://dl.google.com/go/${GO_ARCHIVE}"

# Function to check if Go is installed
check_go_installed() {
  if command -v go >/dev/null 2>&1; then
    echo "➡️  Go version $(go version) is already installed"
  else
    echo "❌ Go is not installed"
  fi
}

# Function to remove previous Go installation
remove_old_go() {
  echo "🔁 Removing previous Go installation..."
  sudo rm -rf "$GO_DIR"
}

# Function to download and install Go
install_go() {
  echo "⬇️  Downloading Go $GO_VERSION..."
  wget -q --show-progress "$DOWNLOAD_URL" -O "/tmp/${GO_ARCHIVE}"

  echo "📦 Extracting Go archive..."
  sudo tar -C /usr/local -xzf "/tmp/${GO_ARCHIVE}"

  echo "✅ Go $GO_VERSION installed at /usr/local/go"
}

# Function to configure Go environment
configure_env() {
  echo "⚙️  Configuring Go environment..."
  GO_ENV_LINE='export PATH=$PATH:/usr/local/go/bin'

  if ! grep -q "$GO_ENV_LINE" ~/.bashrc; then
    echo "$GO_ENV_LINE" >> ~/.bashrc
  fi

  export PATH=$PATH:/usr/local/go/bin

  echo "🧠 PATH updated. Go is now available in the terminal."
}

# Main execution
check_go_installed
remove_old_go
install_go
configure_env

echo "🎉 Golang $GO_VERSION installation completed!"
go version
