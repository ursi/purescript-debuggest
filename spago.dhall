{ name = "my-project"
, dependencies = [ "prelude", "unsafe-coerce" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
