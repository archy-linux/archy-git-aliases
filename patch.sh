#!/bin/sh

config_file="/etc/gitconfig"
include_section="[include]"
include_line="path = archyGitAliases"

# Check if the gitconfig file exists
if [[ ! -f "$config_file" ]]; then
  # Create the gitconfig file if it doesn't exist
  sudo touch "$config_file"
  echo "Created $config_file"
fi

# Check if the include section already exists in the gitconfig file
if ! awk -F "=" -v section="$include_section" '$1 == section { found = 1; exit } END { exit !found }' "$config_file"; then
  # Add the include section to the gitconfig file
  echo -e "\n$include_section" >> "$config_file"
fi

# Check if the alias line already exists in the include section
if ! awk -F "=" -v section="$include_line" '$1 == section { found = 1; exit } END { exit !found }' "$config_file"; then
  sed -i "/^\[include\]$/a\   path = archyGitAliases" /etc/gitconfig
fi
