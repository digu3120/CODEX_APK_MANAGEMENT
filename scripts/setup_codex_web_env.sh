#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="$ROOT_DIR/.venv"

print_header() {
  echo "==> $1"
}

require_cmd() {
  local cmd="$1"
  local hint="$2"

  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "[ERROR] Missing required command: $cmd"
    echo "        $hint"
    exit 1
  fi
}

print_header "Validating required commands"
require_cmd bash "Use a POSIX-compatible environment with bash available."
require_cmd git "Install git in your Codex Web image."
require_cmd python3 "Install Python 3.10+ in your Codex Web image."
require_cmd pip "Install pip for Python 3."
require_cmd java "Install JDK 17+ in your Codex Web image."
require_cmd adb "Install Android platform-tools in your Codex Web image."

print_header "Creating virtual environment"
python3 -m venv "$VENV_DIR"

# shellcheck disable=SC1090
source "$VENV_DIR/bin/activate"

print_header "Upgrading pip"
python -m pip install --upgrade pip

print_header "Installing Python dependencies"
pip install -r "$ROOT_DIR/requirements.txt"

print_header "Creating workspace directories"
mkdir -p "$ROOT_DIR/artifacts" "$ROOT_DIR/input_apks" "$ROOT_DIR/output_apks"

print_header "Environment setup complete"
echo "Activate with: source .venv/bin/activate"
