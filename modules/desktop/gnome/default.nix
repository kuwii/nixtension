{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.desktop.gnome;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    ../common
  ];

  options.nixtension.desktop.gnome = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Gnome desktop environment.";
    };
    gdm = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Install and enable GDM display manager.";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      # enable gnome
      services.xserver.enable = true;
      services.desktopManager.gnome.enable = true;
      # install some useful packages & extensions
      services.udev.packages = with pkgs; [
        gnome-settings-daemon
      ];
      environment.systemPackages = with pkgs; [
        zenity
      ];
    })
    (mkIf cfg.gdm.enable {
      services.xserver.enable = true;
      services.displayManager.gdm.enable = true;
    })
  ];
}
