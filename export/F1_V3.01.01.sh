#!/bin/sh
echo -ne '\033c\033]0;F1\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/F1_V3.01.01.x86_64" "$@"
