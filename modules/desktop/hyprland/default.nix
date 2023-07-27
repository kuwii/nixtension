{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.desktop.hyprland;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [
    ./options.nix
  ];

  config = mkMerge [
    (mkIf cfg.enable {
      networking.networkmanager.enable = true;
      hardware.bluetooth.enable = true;

      services.xserver.enable = true;
      services.pipewire.enable = true;
      security.polkit.enable = true;

      programs.hyprland.enable = true;
      programs.hyprland.xwayland.enable = true;
      programs.xwayland.enable = true;
      programs.dconf.enable = true;

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
      environment.systemPackages = with pkgs; [
        # terminal
        kitty
        # notification daemon
        dunst libnotify
        # authentication agent
        libsForQt5.polkit-kde-agent nixtension.polkit-kde-agent-runner
        # qt wayland support
        libsForQt5.qt5.qtwayland qt6.qtwayland
        # network manager
        networkmanagerapplet
        # application launcher
        wofi
        # x compatibility
        xorg.xhost
      ];
    })
    (mkIf cfg.sddm.enable {
      services.xserver.displayManager.sddm.enable = true;
      services.xserver.displayManager.sddm.enableHidpi = true;
    })
  ];
}
