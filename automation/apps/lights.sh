#!/bin/bash
source /home/pi/.local/bin/virtualenvwrapper.sh
workon siri
export FLASK_RUN_PORT=8050
export FLASK_APP=lights.py
flask run --host 0.0.0.0

