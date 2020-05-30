#!/bin/bash

# Time tracker Start
echo START: `date`

# ..:: DEV

ENVIRONMENT='dev'

ENVIRONMENT_DIR="/${ENVIRONMENT}"

ENVIRONMENTS_DIR="/.temp"

PROJECT_DIR="/project"

PWD="$(pwd)"

# Define environment dependencies FOLDER
VENV_DIR="${PWD}${ENVIRONMENTS_DIR}${ENVIRONMENT_DIR}"

# Clear environment dependencies FOLDER
if [ -d "$VENV_DIR" ]; then
    rm -rf $VENV_DIR
fi

# Create venv directory
python3.6 -m venv $VENV_DIR

# Activate venv directory
.  .${ENVIRONMENTS_DIR}${ENVIRONMENT_DIR}/bin/activate

# https://github.com/tensorflow/tensorflow/issues/348
# Issue ref: https://stackoverflow.com/a/59596814/2513972
pip3.6 install wheel

# Install requirements
pip3.6 install -r "requirements_${ENVIRONMENT}.txt"


export PYTHONPATH="${PYTHONPATH}:${PWD}${PROJECT_DIR}"


# Time tracker End
echo END: `date`
