#!/bin/sh

config_file="$1/gitconfig"

sed -i '/^[[:space:]]*path = archyGitAliases/d' "$config_file"
