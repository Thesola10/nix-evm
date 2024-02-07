{ pkgs, lib, stdenv, nix, ima-evm-utils, makeWrapper
, ... }:

stdenv.mkDerivation rec {
  name = "nix-evm";

  src = ./.;

  nativeBuildInputs = with pkgs;
    [ makeWrapper
    ];

  buildInputs = with pkgs;
    [ nix
      ima-evm-utils
      attr
      gzip
      bash
    ];

  installPhase = ''
    mkdir -p $out/bin
    cp nix-evm $out/bin
    wrapProgram $out/bin/nix-evm \
      --prefix PATH : ${lib.makeBinPath buildInputs}
  '';
}
