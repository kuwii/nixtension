{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.git;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.git = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install git related software.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      nixtension.config.packages = with pkgs; [
        git lazygit
      ];
    })
  ];
}
