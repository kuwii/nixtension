{ config, lib, pkgs, ... }:

let
  allowUnfree = config.nixpkgs.config.allowUnfree or false;
  cfg = config.nixtension.programs.compression-software;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.compression-software = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install common compression software.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      nixtension.config.packages = with pkgs; [
        unzip p7zip ouch
      ];
    })
    (mkIf (allowUnfree && cfg.enable) {
      nixtension.config.packages = with pkgs; [
        unrar
      ];
    })
  ];
}
