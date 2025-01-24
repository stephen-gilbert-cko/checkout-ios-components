#!/bin/bash
# This script:
# Copies .env-example.xcconfig to .env.xcconfig if .env.xcconfig does not exist

echo "EnvironmentVars init"
CONFIGURATION_PATH="SampleApplication/SampleApplication/Configuration"

# Path to the env.xcconfig file

xcconfig_file="${CONFIGURATION_PATH}/env.xcconfig"

example_xcconfig_file="${CONFIGURATION_PATH}/env-example.xcconfig"
cp "$example_xcconfig_file" "$xcconfig_file"
echo "Copied from '$example_xcconfig_file' to '$xcconfig_file'"
