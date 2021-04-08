{ ps-pkgs, ... }:
  with ps-pkgs;
  { version = "0.4.0";
    repo = "https://github.com/ursi/purescript-debuggest.git";
    rev = "0bbfa416ebdf7383b89f2471dda9ef22bc2c3028";
    dependencies = [ prelude unsafe-coerce ];
  }
