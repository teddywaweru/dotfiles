#!/bin/bash
ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%mem | head -10
