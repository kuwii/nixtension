{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.hardware-tools;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.hardware-tools = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install hardware tools.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      nixtension.config.packages = with pkgs; [
        dmidecode pciutils hwinfo
        parted gparted
        lshw mesa-demos inxi
      ];
    })
  ];
}
