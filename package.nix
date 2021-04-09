{ ps-pkgs, ... }:
  with ps-pkgs;
  { version = "0.4.0";
    dependencies = [ prelude unsafe-coerce ];
  }
