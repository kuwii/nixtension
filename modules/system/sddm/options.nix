{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.pinyin;
  inherit (lib) mkOption types;
in
{
  options.nixtension.system.sddm = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable SDDM and use breeze theme.";
    };
  };
}
