{ pkgs, options, ... }:
{
  imports = [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix> ];

  boot.loader.timeout = 0;
  boot.loader.grub.device = "/dev/sda";
  boot.cleanTmpDir = true;

  fileSystems."/" = { device = "/dev/sda1"; fsType = "ext4"; };

  services.openssh.enable = true;

  # These get replaced within the packer build
  users.users.root.openssh.authorizedKeys.keys = [
    ''ssh_key''
  ];
}
