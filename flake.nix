{ inputs.purs-nix.url = "github:ursi/purs-nix";

  outputs = { nixpkgs, utils, purs-nix, ... }:
    utils.defaultSystems
      ({ make-shell, pkgs, system }:
         with pkgs;
         let
           pn = purs-nix { inherit system; };
           inherit (pn) purs;

           inherit
             (purs
                { inherit (import ./package.nix pn) dependencies;
                  src = ./src;
                }
             )
             shell;
         in
         { devShell =
             make-shell
               { packages =
                   with pkgs;
                   [ nodejs
                     nodePackages.bower
                     nodePackages.pulp
                     purescript
                     (shell {})
                   ];
               };
         }
      )
      nixpkgs;
}
