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
    nixtension.programs.git.enable = true;
    nixtension.programs.system-tools.enable = true;
    nixtension.programs.hardware-tools.enable = true;

    networking.networkmanager.enable = true;
    environment.systemPackages = with pkgs; [
      nixos-option
    ];
  });
}
