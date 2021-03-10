#!/bin/sh -e

echo 'Setting up Nix'

apt-get -qq install sudo

mkdir /nix

addgroup --system --gid 30000 nixbld

for i in $(seq 1 32); do
    useradd --home-dir /var/empty --gid nixbld --groups nixbld --no-create-home --no-user-group --system --shell /usr/sbin/nologin --uid $((30000 + i)) nixbld$i
done

curl -Ls https://nixos.org/nix/install | sh
