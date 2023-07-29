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
    (mkIf (cfg.enable) (import ./system.nix { inherit lib pkgs; }))
    (mkIf (cfg.enable) (import ./must-have.nix { inherit lib pkgs; }))
    (mkIf (cfg.enable) (import ./status-bar.nix { inherit pkgs; }))
    (mkIf cfg.enable {

      programs.hyprland.enable = true;
      programs.hyprland.xwayland.enable = true;

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
      environment.systemPackages = with pkgs; [
        # application launcher
        wofi
        # x compatibility
        xorg.xhost
      ];
    })
    (mkIf (cfg.enable && cfg.sddm.enable) {
      nixtension.system.sddm.enable = true;
    })
  ];
}
