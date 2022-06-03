{ config, lib, pkgs, ... }:

let
  allowUnfree = config.nixpkgs.config.allowUnfree or false;
  cfg = config.nixtension.programs.compression;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.compression = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install common compression software.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        unzip libsForQt5.ark p7zip
      ];
    })
    (mkIf (allowUnfree && cfg.enable) {
      environment.systemPackages = with pkgs; [
        unrar
      ];
    })
  ];
}
