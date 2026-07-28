#!/bin/bash

playerctl --player=spotify metadata --format '{"text": "{{artist}} - {{title}}", "alt": "spotify", "tooltip": "{{title}} - {{artist}} ({{album}})", "class": "{{status}}"}' -F
