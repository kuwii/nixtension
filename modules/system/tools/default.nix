{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.tools;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.tools = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install basic system tools.";
    };
  };

  config = (mkIf cfg.enable {
    networking.networkmanager.enable = true;
    environment.systemPackages = with pkgs; [
      binutils
      feh
      wget curl nettools
      rsync
      git
      dmidecode pciutils hwinfo
      parted gparted
      nixos-option
    ];
  });
}
