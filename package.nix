{ ps-pkgs, licenses, ... }:
  with ps-pkgs;
  { version = "0.5.0";
    dependencies = [ prelude unsafe-coerce ];

    pursuit =
      { name = "debuggest";
        repo = "https://github.com/ursi/purescript-debuggest.git";
        license = licenses.bsd3;
      };
  }
