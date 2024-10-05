{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.desktop.kde;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    ../common
  ];

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
    high-dpi = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable high DPI mode.";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      services.desktopManager.plasma6.enable = true;
      # install some useful packages & extensions
      environment.systemPackages = with pkgs; [
        kdePackages.partitionmanager
        polonium
      ];
    })
    (mkIf cfg.sddm.enable {
      services.displayManager.sddm.enable = true;
      services.displayManager.sddm.enableHidpi = cfg.high-dpi.enable;
    })
  ];
}
