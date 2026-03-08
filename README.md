# CODEX APK Management

This repository is prepped to run in **Codex Web** with a repeatable local environment bootstrap.

## Quick start (Codex Web)

1. Open this repository in Codex Web.
2. Run:
   ```bash
   bash scripts/setup_codex_web_env.sh
   ```
3. Activate the virtual environment:
   ```bash
   source .venv/bin/activate
   ```
4. Confirm tooling:
   ```bash
   python --version
   adb version
   ```

## What the setup script does

- Validates required tools (`bash`, `git`, `python3`, `pip`, `java`, `adb`)
- Creates a local Python virtual environment at `.venv`
- Installs Python dependencies from `requirements.txt`
- Creates working folders:
  - `artifacts/`
  - `input_apks/`
  - `output_apks/`

## Notes

- Android SDK / platform tools availability depends on your Codex Web image.
- If `adb` or Java is missing, the script will print exactly what to install.
