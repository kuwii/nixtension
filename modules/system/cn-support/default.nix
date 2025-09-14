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
    tuna-mirror = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Setup to use TUNA Nix mirror.";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      # pinyin support based on fcitx
      nixtension.system.pinyin.enable = true;
      # set locales
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "zh_CN.UTF-8";
        LC_IDENTIFICATION = "zh_CN.UTF-8";
        LC_MEASUREMENT = "zh_CN.UTF-8";
        LC_MONETARY = "zh_CN.UTF-8";
        LC_NAME = "zh_CN.UTF-8";
        LC_NUMERIC = "zh_CN.UTF-8";
        LC_PAPER = "zh_CN.UTF-8";
        LC_TELEPHONE = "zh_CN.UTF-8";
        LC_TIME = "zh_CN.UTF-8";
      };
      # set timezone
      time.timeZone = "Asia/Shanghai";
    })
    (mkIf cfg.tuna-mirror.enable {
      nix.settings.substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.nixos.org"
      ];
    })
  ];
}
