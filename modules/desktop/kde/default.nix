{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.desktop.kde;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.desktop.kde = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install KDE desktop environment.";
    };
    sddm = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Install and enable SDDM display manager.";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      # enable gnome
      services.xserver.enable = true;
      services.desktopManager.plasma6.enable = true;
      services.xserver.desktopManager.plasma5.useQtScaling = true;
      # setup touchpad
      services.libinput.enable = true;
      services.libinput.touchpad.tapping = true;
      # enable some useful features
      hardware.bluetooth.enable = true;
      networking.networkmanager.enable = true;
      programs.dconf.enable = true;
      programs.xwayland.enable = true;
      # install some useful packages & extensions
      environment.systemPackages = with pkgs; [
        kdePackages.partitionmanager
      ];
    })
    (mkIf cfg.sddm.enable {
      services.displayManager.sddm.enable = true;
    })
  ];
}
