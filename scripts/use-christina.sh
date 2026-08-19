#!/bin/bash
# Script to switch to the christina profile

echo "Switching to Christina profile..."
export HERMES_PROFILE=christina
echo "Profile switched to: $HERMES_PROFILE"

# Show current profile info
echo "Current Hermes profile: $HERMES_PROFILE"
echo "Profile directory: ~/.hermes/profiles/$HERMES_PROFILE"