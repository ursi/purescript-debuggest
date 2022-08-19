{ inputs =
    { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      make-shell.url = "github:ursi/nix-make-shell/1";
      purs-nix.url = "github:purs-nix/purs-nix/ps-0.15";
      utils.url = "github:ursi/flake-utils/8";
    };

  outputs = { utils, ... }@inputs:
    utils.apply-systems { inherit inputs; }
      ({ make-shell, pkgs, purs-nix, ... }:
         let
           inherit (purs-nix) purs;
           package = import ./package.nix purs-nix;
           inherit (purs { inherit (package) dependencies; }) command;
         in
         { devShell =
             make-shell
               { packages =
                   with pkgs;
                   [ nodejs
                     nodePackages.bower
                     nodePackages.pulp
                     purs-nix.purescript

                     (command
                        { inherit package;
                          bundle = { main = false; module = "Debug"; };
                        }
                     )
                   ];
               };
         }
      );
}
