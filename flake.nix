{ inputs.purs-nix.url = "github:ursi/purs-nix";

  outputs = { nixpkgs, utils, purs-nix, ... }:
    utils.defaultSystems
      ({ make-shell, pkgs, system }:
         with pkgs;
         let
           pn = purs-nix { inherit system; };
           inherit (pn) purs;
           package = import ./package.nix pn;

           inherit
             (purs
                { inherit (package) dependencies;
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
                     (shell { inherit package; })
                   ];
               };
         }
      )
      nixpkgs;
}
