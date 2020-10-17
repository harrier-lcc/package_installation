#!/usr/bin/fish

set fish_trace 1

sudo apt update && sudo apt install build-essential pkg-config libssh-dev lld -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
source $HOME/.cargo/env

echo "contains $HOME/.cargo/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.cargo/bin" >> ~/.config/fish/config.fish

echo -e "[target.x86_64-unknown-linux-gnu]\nrustflags = [\n   \"-C\", \"link-arg=-fuse-ld=lld\",\n]" > ~/.cargo/config

# fish autocomplete
mkdir -p ~/.config/fish/completions
rustup completions fish > ~/.config/fish/completions/rustup.fish

# sccache
which sccache; or cargo install sccache

echo -e "[build]\nrustc-wrapper = \""(which sccache)"\"\n" (string join \n (cat ~/.cargo/config)) > ~/.cargo/config

# cargo tools
cargo install cargo-audit cargo-update cargo-edit cargo-expand cargo-outdated cargo-udeps cargo-geiger cargo-tree cargo-diet

