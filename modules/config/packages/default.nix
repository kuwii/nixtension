{ config, ... }:

let
  cfg = config.nixtension.config.packages;
in
{
  imports = [ ./config.nix ];

  config = {
    environment.systemPackages = cfg;
  };
}
