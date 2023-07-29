{ pkgs }:

let
  inherit (pkgs.plasma5Packages) kdeFrameworks;
in
{
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.theme = "breeze";
  services.xserver.displayManager.sddm.enableHidpi = true;

  environment.systemPackages = with pkgs.libsForQt5; [
    kconfig
    kcoreaddons
    kdeclarative

    plasma-framework
    plasma-workspace
    plasma-workspace-wallpapers

    kirigami2

    breeze-qt5
    breeze-gtk
    breeze-icons

    qtvirtualkeyboard
  ];
  environment.pathsToLink = [
    "/share"
  ];
}
