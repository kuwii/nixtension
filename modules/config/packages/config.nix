{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.config.packages = mkOption {
    type = types.listOf types.package;
    default = [];
    description = "Packages to install.";
  };
}
