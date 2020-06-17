#!/bin/bash

set -eux

sudo pmset -a \
  powernap 0
sudo pmset -b \
  sleep 10 \
  displaysleep 10
sudo pmset -c \
  sleep 0 \
  displaysleep 30
