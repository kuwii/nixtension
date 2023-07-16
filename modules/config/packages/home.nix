{ config, ... }:

let
  cfg = config.nixtension.config.packages;
in
{
  imports = [ ./config.nix ];

  config = {
    home.packages = cfg;
  };
}
