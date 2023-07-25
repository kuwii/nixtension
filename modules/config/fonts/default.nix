{ config, ... }:

let
  cfg = config.nixtension.config.fonts;
in
{
  imports = [ ./options.nix ];

  config = {
    fonts.fonts = cfg;
  };
}
