{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.system.username = mkOption {
    type = types.str;
    default = "";
    description = "Username of the default user.";
  };
}
