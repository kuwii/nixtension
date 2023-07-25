{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.config.fonts = mkOption {
    type = types.listOf types.package;
    default = [];
    description = "Fonts to use.";
  };
}
