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
    (mkIf (cfg.enable) (import ./network.nix { inherit pkgs; }))
    (mkIf (cfg.enable) (import ./polkit.nix { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.sddm.enable) (import ./sddm.nix { inherit pkgs; }))
    (mkIf cfg.enable {
      hardware.bluetooth.enable = true;

      services.xserver.enable = true;
      services.pipewire.enable = true;

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
        # qt wayland support
        libsForQt5.qt5.qtwayland qt6.qtwayland
        # application launcher
        wofi
        # x compatibility
        xorg.xhost
      ];
    })
  ];
}
