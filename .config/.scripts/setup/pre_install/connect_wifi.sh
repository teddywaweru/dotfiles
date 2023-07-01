#!/bin/bash
# Connect to WiFi

iwctl station wlan0 connect "$1" password "$2"
