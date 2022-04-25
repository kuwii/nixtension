{ config, lib, pkgs, ... }:

let
  cfg = config.nixt.system.tools;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixt.system.tools = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install basic system tools.";
    };
  };

  config = (mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      binutils
      wget curl nettools
      rsync
      git
      dmidecode pciutils
      parted gparted
      nixos-option
    ];
  });
}
