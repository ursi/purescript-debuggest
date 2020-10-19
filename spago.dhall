{ name = "debuggest"
, dependencies = [ "prelude", "unsafe-coerce" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, license = "BSD-3-Clause"
, repository = "https://github.com/ursi/purescript-debuggest.git"
}
