#!/usr/bin/env bash

# Build script for TAILMON ZER0
# Concatenates modular source files into a single deployable script

set -euo pipefail

echo "Building TAILMON ZER0..."

cat src/*.sh > tailmon-zero.sh
chmod +x tailmon-zero.sh

echo "Build complete! Output saved to tailmon-zero.sh"
