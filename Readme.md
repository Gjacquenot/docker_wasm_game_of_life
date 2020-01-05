# Docker version of [rustwasm/wasm_game_of_life](https://github.com/rustwasm/wasm_game_of_life)

[![Build Status](https://travis-ci.org/Gjacquenot/docker_wasm_game_of_life.svg?branch=master)](https://travis-ci.org/Gjacquenot/docker_wasm_game_of_life)

This repository contains instructions to build a dockerize version
of the Rust and WebAssembly tutorial implementing the Game of Life.

A simple `make` command will build the `wasm_game_of_life/www` directory to serve.

`make run` will serve `http://localhost:8080`. It requires `npm` to be installed.

`make docker_run` will serve `http://localhost:8080` from `docker`.
