{ lib, pkgs }:

let
  inherit (lib) mkMerge;
in
mkMerge [
  # terminal
  ({
    environment.systemPackages = with pkgs; [
      kitty
    ];
  })
  # notification daemon
  ({
    environment.systemPackages = with pkgs; [
      dunst libnotify
    ];
  })
  # pipewire
  ({
    services.pipewire.enable = true;
  })
  # authentication agent
  ({
    security.polkit.enable = true;
    environment.systemPackages = with pkgs; [
      libsForQt5.polkit-kde-agent nixtension.run-polkit-kde-agent
    ];
  })
  # qt wayland support
  ({
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtwayland qt6.qtwayland
    ];
  })
]
