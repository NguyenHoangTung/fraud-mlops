#!/usr/bin/env bash
# Quick setup for Fraud Detection MLOps on Ubuntu
set -euo pipefail

echo ">>> Updating APT and installing base tools..."
sudo apt-get update -y
sudo apt-get install -y   curl ca-certificates gnupg lsb-release   git make build-essential unzip   python3 python3-venv python3-pip   openjdk-17-jdk   postgresql-client   redis-tools

echo ">>> Installing Docker & Compose..."
sudo apt-get install -y docker.io docker-compose-plugin
sudo systemctl enable --now docker

if ! groups $USER | grep -q docker; then
  sudo usermod -aG docker $USER || true
fi

JAVA_HOME_PATH=$(dirname "$(dirname "$(readlink -f "$(which java)")")")
if ! grep -q "JAVA_HOME" ~/.bashrc; then
  echo "export JAVA_HOME=\"$JAVA_HOME_PATH\"" >> ~/.bashrc
  echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> ~/.bashrc
fi

if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi
source .venv/bin/activate
python -m pip install --upgrade pip wheel setuptools
python -m pip install -r requirements-dev.txt || true

python -c "import pyspark, feast, bentoml, sklearn, xgboost; print('Python libs OK')"
