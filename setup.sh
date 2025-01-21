#!/bin/bash

# Create a virtual environment
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install required packages
pip install ansible molecule ansible-lint

# Verify installation
ansible --version
molecule --version
