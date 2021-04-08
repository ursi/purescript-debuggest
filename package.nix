{ ps-pkgs, ... }:
  with ps-pkgs;
  { version = "0.4.0";
    repo = "https://github.com/ursi/purescript-debuggest.git";
    rev = "";
    dependencies = [ prelude unsafe-coerce ];
  }
