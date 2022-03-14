{ config, lib, pkgs, ... }:

let
  cfg = config.nixt.system.pinyin;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixt.system.pinyin = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable pinyin input method based on Fcitx.";
    };
  };

  config = (mkIf cfg.enable {
    i18n.inputMethod.enabled = "fcitx";
    i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ libpinyin ];
  });
}
