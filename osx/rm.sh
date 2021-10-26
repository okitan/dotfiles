#!/bin/bash

set -eu

packages=(GarabeBand iMovie)
for package in "${packages[@]}"; do
  (
    set -x
    sudo -S rm -rf "/Applications/${package}.app"
  )
done
