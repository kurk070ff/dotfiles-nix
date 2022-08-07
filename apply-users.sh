#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/kurkotoff/home.nix
popd
