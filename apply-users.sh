#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.kurkotoff.activationPackage
./result/activate
popd
