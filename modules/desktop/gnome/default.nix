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
      wayland = {
        enable = mkOption {
          type = types.bool;
          default = true;
          description = "Allow GDM to run on Wayland instead of Xserver.";
        };
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      # enable gnome
      services.xserver.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
      # install some useful packages & extensions
      services.dbus.packages = with pkgs; [
        gnome2.GConf
      ];
      services.udev.packages = with pkgs; [
        gnome.gnome-settings-daemon
      ];
      environment.systemPackages = with pkgs; [
        gnome.adwaita-icon-theme
        gnomeExtensions.simple-system-monitor
        gnomeExtensions.material-shell
        gnomeExtensions.blur-my-shell
        gnome.gnome-tweaks
      ];
    })
    (mkIf cfg.gdm.enable {
      services.xserver.enable = true;
      services.xserver.displayManager.gdm.wayland = cfg.gdm.wayland.enable;
      services.xserver.displayManager.gdm.enable = true;
    })
  ];
}
