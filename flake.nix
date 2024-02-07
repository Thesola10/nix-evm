{ description = "Generate a signed EVM xattrs image from a Nix path or closure";

  inputs."nixpkgs".url = github:NixOS/nixpkgs;

  outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem
    (system:
    let pkgs = import nixpkgs { inherit system; };
    in
    { packages.default = pkgs.callPackage ./default.nix {};
    });
}
