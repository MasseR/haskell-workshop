{ nixpkgs ? import <nixpkgs> {} }:


with nixpkgs.pkgs; rec {
  workshop1-slides = import ./workshop1/slides {};
  workshop1-cheatsheet = import ./workshop1/cheatsheet {};
  workshop1 = pkgs.haskellPackages.callPackage ./workshop1/csv2json {};
  workshop1-shell = pkgs.buildEnv {
    name = "workshop1-shell";
    paths = [];
    buildInputs = with pkgs.haskellPackages; [
      pkgs.binutils
      hlint
      stylish-haskell
      ghcid
      cabal-install
      hpack
      (ghcWithPackages (_: workshop1.buildInputs ++ workshop1.propagatedBuildInputs))
    ];
  };
}
