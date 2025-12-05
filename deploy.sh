#!/bin/bash
set -euo pipefail

echo "Starting JupyterLite build for Vercel deployment..."

# Download and install micromamba
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

# Create Python environment
./bin/micromamba create -y -n build python=3.12

# Activate environment and install dependencies
eval "$(./bin/micromamba shell hook --shell bash)"
micromamba activate build

# Install Python dependencies
pip install -r requirements-deploy.txt

# Build JupyterLite
jupyter lite build --output-dir dist

echo "JupyterLite build completed successfully!"