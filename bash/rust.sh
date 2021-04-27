#!/usr/bin/bash -x

sudo apt update && sudo apt install build-essential curl pkg-config libssh-dev lld -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
source $HOME/.cargo/env

echo -e "[target.x86_64-unknown-linux-gnu]\nrustflags = [\n   \"-C\", \"link-arg=-fuse-ld=lld\",\n]" > ~/.cargo/config

# fish autocomplete
rustup completions bash cargo >> ~/.local/share/bash-completion/completions/cargo

# sccache
which sccache || cargo install sccache

echo -e "[build]\nrustc-wrapper = \"`which sccache`\"\n\n`cat ~/.cargo/config`" > ~/.cargo/config

# cargo tools
cargo install cargo-audit cargo-update cargo-edit cargo-expand cargo-outdated cargo-udeps cargo-geiger cargo-tree cargo-diet

