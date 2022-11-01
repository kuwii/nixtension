{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.desktop.gnome;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.desktop.gnome = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Gnome desktop environment.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      # enable gnome
      services.xserver.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
      # setup services
      programs.dconf.enable = true;
      services.dbus.packages = with pkgs; [
        gnome2.GConf
      ];
      services.udev.packages = with pkgs; [
        gnome.gnome-settings-daemon
      ];
      # setup touchpad
      services.xserver.libinput.enable = true;
      services.xserver.libinput.touchpad.tapping = true;
      # install some useful packages & extensions
      environment.systemPackages = with pkgs; [
        gnome.adwaita-icon-theme
        gnomeExtensions.simple-system-monitor
        gnomeExtensions.material-shell
        gnome.gnome-tweaks
      ];
    })
  ];
}
