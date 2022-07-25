#!/bin/sh
UID="$1"
shift

# Stop on error
set -e

# Create user
useradd user --uid="$UID"

# Launch desired command
cd /mnt/data
exec gosu user focus-stack "$@"
