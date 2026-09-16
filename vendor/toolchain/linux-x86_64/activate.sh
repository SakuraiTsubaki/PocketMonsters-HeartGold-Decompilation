#!/usr/bin/env bash
R="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$R/bin:$R/binutils/bin:$R/ndstool/bin:$PATH"
