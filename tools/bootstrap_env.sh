#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
export PROJECT_ROOT="$ROOT_DIR"
export GEN4_TOOLCHAIN_ROOT="$ROOT_DIR/vendor/toolchain/linux-x86_64"
ACTIVATE="$GEN4_TOOLCHAIN_ROOT/activate.sh"

if [[ ! -f "$ACTIVATE" ]]; then
  echo "error: vendored toolchain is missing: $GEN4_TOOLCHAIN_ROOT" >&2
  echo "Use a complete checkout of this repository; no per-session installation is required." >&2
  return 1 2>/dev/null || exit 1
fi

# shellcheck disable=SC1090
source "$ACTIVATE"

missing=0
for tool in arm-none-eabi-objdump arm-none-eabi-objcopy arm-none-eabi-readelf ndstool melonds; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "error: vendored tool not found after activation: $tool" >&2
    missing=1
  fi
done

if (( missing )); then
  return 1 2>/dev/null || exit 1
fi

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "Vendored Generation IV NDS toolchain verified at: $GEN4_TOOLCHAIN_ROOT"
  echo "For a persistent PATH in the current shell, run: source tools/bootstrap_env.sh"
else
  echo "Vendored Generation IV NDS toolchain active: $GEN4_TOOLCHAIN_ROOT"
fi
