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
      services.xserver.desktopManager.plasma5.enable = true;
      services.xserver.desktopManager.plasma5.useQtScaling = true;
      # setup touchpad
      services.xserver.libinput.enable = true;
      services.xserver.libinput.touchpad.tapping = true;
      # install some useful packages & extensions
      networking.networkmanager.enable = true;
      programs.dconf.enable = true;
      programs.xwayland.enable = true;
      environment.systemPackages = with pkgs; [
        libsForQt5.ark
        libsForQt5.discover
        libsForQt5.kamoso
        libsForQt5.kate
        libsForQt5.krdc
        libsForQt5.bismuth
        libsForQt5.nota
        partition-manager
      ];
    })
    (mkIf cfg.sddm.enable {
      services.xserver.enable = true;
      services.xserver.displayManager.sddm.enable = true;
      services.xserver.displayManager.sddm.enableHidpi = true;
    })
  ];
}
