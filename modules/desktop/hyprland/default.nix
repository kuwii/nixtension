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
      programs.hyprland.enable = true;
      programs.hyprland.xwayland.enable = true;
      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
      environment.systemPackages = with pkgs; [
        kitty
      ];
    })
  ];
}
