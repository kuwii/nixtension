{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.sddm;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    (mkIf (cfg.enable) {
      services.xserver.enable = true;
  
      services.xserver.displayManager.sddm.enable = true;
      services.xserver.displayManager.sddm.enableHidpi = true;
      services.xserver.displayManager.sddm.theme = "breeze";
    
      environment.systemPackages = with pkgs.libsForQt5; [
        kconfig kcoreaddons kdeclarative
        plasma-framework plasma-workspace plasma-workspace-wallpapers
        kirigami2
        breeze-qt5 breeze-gtk breeze-icons
        qtvirtualkeyboard
      ];
      environment.pathsToLink = [
        "/share"
      ];
    })
  ];
}
