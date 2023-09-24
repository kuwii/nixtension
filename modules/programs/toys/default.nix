{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.toys;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.toys = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install some toys for fun.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      nixtension.config.packages = with pkgs; [
        fortune
        cowsay neo-cowsay ponysay pokemonsay
        cmatrix tmatrix
        asciiquarium
        pipes
        aalib
        cbonsai
        lavat
        hollywood
      ];
    })
  ];
}
