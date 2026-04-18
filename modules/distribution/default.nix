{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.distribution;
  inherit (lib) mkIf mkMerge mkOption mkDefault types;
in
{
  options.nixtension.distribution = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable nixtention default configs that are necessary in most cases.";
    };
  };
  options.nixtension.distribution.extra = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable extra nixtention configs.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      nixtension.system.boot.enable = mkDefault true;
      nixtension.system.boot.grub.enable = mkDefault true;
      nixtension.system.cn-support.enable = mkDefault true;
      nixtension.system.font.enable = mkDefault true;
      nixtension.system.input.enable = mkDefault true;
      nixtension.system.sound.enable = mkDefault true;
      nixtension.system.tools.enable = mkDefault true;
      nixtension.system.usb-drive.enable = mkDefault true;
      nixtension.system.zsh.enable = mkDefault true;

      nixtension.programs.compression-software.enable = mkDefault true;
      nixtension.programs.system-tools.enable = mkDefault true;
      nixtension.programs.hardware-tools.enable = mkDefault true;
    })

    (mkIf (cfg.enable && cfg.extra.enable) {
      nixtension.system.input.chinese.enable = mkDefault true;
      nixtension.system.input.japanese.enable = mkDefault true;

      nixtension.programs.neovim.enable = mkDefault true;
      nixtension.programs.toys.enable = mkDefault true;
    })
  ];
}
