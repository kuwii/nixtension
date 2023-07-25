{ config, lib, pkgs, ... }:

let
  username = config.nixtension.system.username;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    (mkIf (username != "") {
      users.users.${username} = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager"];
      };
    })
  ];
}
