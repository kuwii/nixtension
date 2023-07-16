{ config, ... }:

let
  cfg = config.nixtension.config.fonts;
in
{
  imports = [ ./config.nix ];

  config = {
    fonts.fonts = cfg;
  };
}
