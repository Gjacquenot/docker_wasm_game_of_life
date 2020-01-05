FROM rust:slim-buster
RUN apt-get update --yes --quiet \
 && apt-get install --no-install-recommends --yes \
    git \
    libssl-dev \
    pkg-config \
    npm \
 && apt-get clean \
 && rm -rf /tmp/* /var/tmp/* \
 && rm -rf /var/lib/apt/lists \
 && cargo install \
    cargo-generate \
    wasm-pack \
 && rustup target add wasm32-unknown-unknown \
 && rustc --version \
 && rustup --version \
 && cargo --version \
 && npm install npm@latest -g
