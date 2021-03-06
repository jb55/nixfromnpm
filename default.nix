{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc7102" }:
let
  haskellPackages = nixpkgs.pkgs.haskell.packages.${compiler};
in

haskellPackages.callPackage ./project.nix {
  pkgs = nixpkgs;
  hnix = haskellPackages.callPackage ../hnix/project.nix {};
  semver-range = haskellPackages.callPackage ../semver-range/project.nix {};
}
