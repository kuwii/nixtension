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
    i18n.inputMethod.enabled = "fcitx5";
    i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-gtk fcitx5-chinese-addons ];
  });
}
