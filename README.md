# nixos-hcloud-packer

Create a NixOS snapshot on Hetzner Cloud using Packer.

Based on: https://nixos.org/nixos/manual/index.html#sec-installing-from-other-distro

## Example Usage

```
nix-build

export HCLOUD_TOKEN="your-token"
export HCLOUD_SSH_KEY="name-of-ssh-key-in-hetzner-cloud"
export HCLOUD_SNAPSHOT_NAME="nixos-18.09-2019-03-29"
export HCLOUD_SNAPSHOT_LOCATION="nbg1"
export HCLOUD_SNAPSHOT_NIXOS_VERSION="19.03"

result/bin/build-snapshot
```

## Known Issues

- cloud-init does not work (e.g. injecting ssh keys via the Hetzner Cloud Console), probably due to outdated version in nixpkgs
- only a single ssh key (that is fetched from Hetzner Cloud) can be specified currently
