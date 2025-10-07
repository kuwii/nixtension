{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.podman;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [
    ./options.nix
  ];

  config = mkMerge [
    (mkIf (cfg.enable) {
      virtualisation.containers.enable = true;
      
      virtualisation.podman.enable = true;
      virtualisation.podman.dockerCompat = true;
      virtualisation.podman.defaultNetwork.settings.dns_enabled = true;

      environment.systemPackages = with pkgs; [
        podman-compose
      ];
    })

    (mkIf (cfg.enable && config.services.xserver.enable) {
      environment.systemPackages = with pkgs; [
        podman-desktop
      ];
    })
  ];
}
