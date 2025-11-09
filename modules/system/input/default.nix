{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.input;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [
    ./options.nix
  ];

  config = mkMerge [
    (mkIf (cfg.enable) {
      i18n.inputMethod.enable = true;
      i18n.inputMethod.type = "fcitx5";
      i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-gtk ];
    })
    (mkIf (cfg.enable && cfg.chinese.enable) {
      i18n.inputMethod.fcitx5.addons = with pkgs.kdePackages; [ fcitx5-chinese-addons ];
    })
    (mkIf (cfg.enable && cfg.japanese.enable) {
      i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-mozc ];
    })
  ];
}
