{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.font;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.font = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install some common fonts.";
    };
  };

  config = (mkIf cfg.enable {
    fonts.fonts = with pkgs; [
      nerdfonts
      arphic-ukai arphic-uming
      source-han-sans source-code-pro source-han-mono source-han-serif
      noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji
      cascadia-code
      hack-font
      dejavu_fonts
      freefont_ttf ipafont iosevka
    ];
  });
}
