{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.pinyin;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.pinyin = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable pinyin input method based on Fcitx.";
    };
  };

  config = (mkIf cfg.enable {
    nixtension.system.input.enable = true;
    nixtension.system.input.chinese.enable = true;
  });
}
