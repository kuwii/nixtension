{ lib, pkgs }:

let
  inherit (lib) mkMerge;
in
mkMerge [
  # xserver
  ({
    services.xserver.enable = true;
    programs.xwayland.enable = true;
    programs.dconf.enable = true;
  })
  # network
  ({
    networking.networkmanager.enable = true;
    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
  })
  # bluetooth
  ({
    hardware.bluetooth.enable = true;
  })
]
