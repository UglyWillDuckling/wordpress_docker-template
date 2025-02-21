#!/usr/bin/env bash

# set -euo pipefail

inspect_args

source_url=${args[source]}
force=${args[--force]}

echo $force

if [[ $force ]]; then
  echo "downloading $source_url with --force"
else
  echo "downloading $source_url"
fi

debug 'hello'
