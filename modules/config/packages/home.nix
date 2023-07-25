{ config, ... }:

let
  cfg = config.nixtension.config.packages;
in
{
  imports = [ ./options.nix ];

  config = {
    home.packages = cfg;
  };
}
