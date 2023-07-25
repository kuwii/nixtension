{ config, ... }:

let
  cfg = config.nixtension.config.packages;
in
{
  imports = [ ./options.nix ];

  config = {
    environment.systemPackages = cfg;
  };
}
