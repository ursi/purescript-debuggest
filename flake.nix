{ inputs.purs-nix.url = "github:ursi/purs-nix";

  outputs = { nixpkgs, utils, purs-nix, ... }:
    utils.defaultSystems
      ({ pkgs, system }:
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
             compile;
         in
         { apps.compile = compile {};

           devShell =
             with pkgs;
             mkShell
               { buildInputs =
                   [ nodejs
                     nodePackages.bower
                     nodePackages.pulp
                     purescript
                   ];
               };
         }
      )
      nixpkgs;
}
