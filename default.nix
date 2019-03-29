{ pkgs ? import <nixpkgs> {} }:
with pkgs;
let
    packer = pkgs.packer.overrideAttrs (old: rec {
        name = "packer-${version}";
        version = "1.3.5";
        src = fetchFromGitHub {
            owner = "hashicorp";
            repo = "packer";
            rev = "v${version}";
            sha256 = "08anrc95nd5j4x4gia9rw151bdb99z72zgjdj8h0h9da177lqhbz";
        };
    });
in
stdenv.mkDerivation {
    name = "nixos-hcloud-packer";

    nativeBuildInputs = [ makeWrapper packer ];

    src = ./src;

    installPhase = ''
        mkdir -p $out/bin

        cp -R ./* $out/

        makeWrapper ${packer}/bin/packer $out/bin/build-snapshot \
            --run "cd $out" \
            --add-flags "build nixos.json"
    '';
}