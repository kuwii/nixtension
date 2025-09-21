{ config, lib, pkgs, ... }:

let
  hostname = config.nixtension.system.hostname;
  inherit (lib) mkIf mkOption types;
in
{
  options.nixtension.system.hostname = mkOption {
    type = types.str;
    default = "";
    description = "Hostname of this computer.";
  };

  config = (mkIf (hostname != "") {
    networking.hostName = hostname;
  });
}
