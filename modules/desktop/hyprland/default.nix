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
      services.xserver.enable = true;
      services.pipewire.enable = true;
      security.polkit.enable = true;

      programs.hyprland.enable = true;
      programs.hyprland.xwayland.enable = true;
      programs.dconf.enable = true;

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
      environment.systemPackages = with pkgs; [
        kitty                               # terminal
        dunst                               # notification daemon
        libsForQt5.polkit-kde-agent         # authentication agent
        nixtension.polkit-kde-agent-runner  #
        libsForQt5.qt5.qtwayland            # qt wayland support
        qt6.qtwayland                       #
      ];
    })
    (mkIf cfg.sddm.enable {
      services.xserver.displayManager.sddm.enable = true;
      services.xserver.displayManager.sddm.enableHidpi = true;
    })
  ];
}
