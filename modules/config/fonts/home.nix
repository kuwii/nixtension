{ config, ... }:

let
  cfg = config.nixtension.config.fonts;
in
{
  imports = [ ./config.nix ];

  config = {
    home.packages = cfg;
  };
}
