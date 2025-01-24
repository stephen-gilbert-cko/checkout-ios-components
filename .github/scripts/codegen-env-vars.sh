# This script:
# 1. Reads env vars from .env.xcconfig
# 2. Performs EnvironmentVars code generation using Sourcery and EnvironmentVars.stencil template

echo "EnvironmentVars CodeGen"
CONFIGURATION_PATH="SampleApplication/SampleApplication/Configuration"
TEMPLATE_PATH="${CONFIGURATION_PATH}/EnvironmentVars.stencil"

# Path to the env.xcconfig file
xcconfig_file="${CONFIGURATION_PATH}/env.xcconfig"

if ! [ -f "$xcconfig_file" ]; then
    echo "The file '$xcconfig_file' does not exist. Run 'env_vars_init.sh' first."
    exit 1;
fi

echo "Performing EnvironmentVars CodeGen."

# Declare an empty string to hold the env variables in comma separated format
env_vars=""

# Read each line from the xcconfig file
while IFS= read -r line; do
  # Ignore comments and empty lines
  if [[ "$line" =~ ^\s*# ]] || [[ -z "$line" ]]; then
    continue
  fi

  # Extract the variable name and value from the line
  var_name="$(echo "$line" | cut -d'=' -f1 | sed 's/ //g')"
  var_value="$(echo "$line" | cut -d'=' -f2- | sed 's/^ *//;s/ *$//')"

  # Append the variable to the env_vars string
  env_vars+="$var_name=$var_value,"
done < "$xcconfig_file"

# Remove the trailing comma
env_vars="${env_vars%,}"

# Install Sourcery

which -s sourcery
if [[ $? != 0 ]] ; then
  brew install sourcery
fi

# Run Sourcery Codegen
sourcery --templates "${TEMPLATE_PATH}" --sources "${CONFIGURATION_PATH}" --output "${CONFIGURATION_PATH}" --args "$env_vars"
