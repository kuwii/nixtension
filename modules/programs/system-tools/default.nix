{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.system-tools;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.system-tools = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install System tools.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      nixtension.programs.git.enable = true;
      nixtension.config.packages = with pkgs; [
        binutils
        feh
        wget curl nettools
        rsync
        fastfetch
        tree
      ];
    })
  ];
}
