{ config, lib, pkgs, ... }:

let
  username = config.nixtension.system.username;
  podman = config.nixtension.system.podman;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    (mkIf (username != "") {
      users.users.${username} = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager" "render" "video"];
      };
    })

    (mkIf (username != "" && podman.enable) {
      users.users.${username} = {
        extraGroups = ["podman"];
      };
    })
  ];
}
