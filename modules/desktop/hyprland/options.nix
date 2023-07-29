{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.desktop.hyprland = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Hyprland desktop environment.";
    };
    sddm = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Install and enable SDDM display manager.";
      };
    };
  };
}
