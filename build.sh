#!/usr/bin/env bash

# Build script for TAILMON ZER0
# Concatenates modular source files into a single deployable script

set -euo pipefail

echo "Building TAILMON ZER0..."

cat src/*.sh > tailmon.sh
chmod +x tailmon.sh

echo "Build complete! Output saved to tailmon.sh"
