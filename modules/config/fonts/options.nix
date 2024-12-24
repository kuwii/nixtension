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

  options.nixtension.config.nerd-fonts = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to install Nerd Fonts.";
    };
  };
}
