#!/usr/bin/bash -x

sudo apt-get update && sudo apt-get install pkg-config libssl-dev libxcb-composite0-dev libx11-dev

cargo install nu --features=extra
