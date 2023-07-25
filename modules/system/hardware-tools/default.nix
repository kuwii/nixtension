{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.hardware-tools;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.hardware-tools = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install basic hardware tools.";
    };
  };

  config = (mkIf cfg.enable {
    nixtension.programs.hardware-tools.enable = true;
  });
}
