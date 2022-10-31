{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.cn-support;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.cn-support = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable support for zh_CN related features, including pinyin, some locales, time zone.";
    };
  };

  config = (mkIf cfg.enable {
    # pinyin support based on fcitx
    nixtension.system.pinyin.enable = true;
    # set locales
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.utf8";
      LC_IDENTIFICATION = "zh_CN.utf8";
      LC_MEASUREMENT = "zh_CN.utf8";
      LC_MONETARY = "zh_CN.utf8";
      LC_NAME = "zh_CN.utf8";
      LC_NUMERIC = "zh_CN.utf8";
      LC_PAPER = "zh_CN.utf8";
      LC_TELEPHONE = "zh_CN.utf8";
      LC_TIME = "zh_CN.utf8";
    };
    # set timezone
    time.timeZone = "Asia/Shanghai";
  });
}
