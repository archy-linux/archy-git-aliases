#!/bin/sh

config_file="/etc/gitconfig"

sed -i '/^[[:space:]]*path = archyGitAliases/d' "$config_file"
