#!/bin/bash
# Script to manage Christina profile setup and configuration

set -e

# Function to display usage
usage() {
    echo "Usage: christina setup <command>"
    echo "Commands:"
    echo "  model <model_name>    - Change the model for Christina profile"
    echo "  help                  - Show this help message"
}

# Function to change the model
change_model() {
    local model_name="$1"
    
    if [ -z "$model_name" ]; then
        echo "Error: Please specify a model name"
        usage
        exit 1
    fi
    
    # Check if config file exists
    CONFIG_FILE="$HOME/.hermes/profiles/christina/config.yaml"
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Error: Christina profile config file not found at $CONFIG_FILE"
        exit 1
    fi
    
    echo "Changing Christina's model to: $model_name"
    
    # Backup the config file
    cp "$CONFIG_FILE" "$CONFIG_FILE.bak"
    
    # Update the model using sed - properly handle the YAML structure
    if grep -q "  default:" "$CONFIG_FILE"; then
        # Replace the existing default line
        sed -i "s/  default:.*/  default: $model_name/" "$CONFIG_FILE"
    else
        # Add the default line if it doesn't exist
        sed -i "/model:/a\  default: $model_name" "$CONFIG_FILE"
    fi
    
    echo "Model changed successfully!"
    echo "Current model configuration:"
    grep -A 1 "model:" "$CONFIG_FILE" | grep "default:"
}

# Main logic
if [ $# -eq 0 ]; then
    echo "No command provided"
    usage
    exit 1
fi

COMMAND="$1"

case "$COMMAND" in
    "model")
        shift
        change_model "$1"
        ;;
    "help")
        usage
        ;;
    *)
        echo "Unknown command: $COMMAND"
        usage
        exit 1
        ;;
esac