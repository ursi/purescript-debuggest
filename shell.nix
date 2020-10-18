with import (import ./nix/sources.nix).nixpkgs {};

mkShell {
  buildInputs = [
    dhall
    nodejs
    nodePackages.bower
    nodePackages.pulp
    purescript
    spago
  ];
}
