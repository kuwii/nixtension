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

    enable-arphic = mkOption {
      type = types.bool;
      default = true;
      description = "Install Arphic fonts.";
    };

    enable-cascadia-code = mkOption {
      type = types.bool;
      default = true;
      description = "Install Cascadia Code font.";
    };

    enable-dejavu-fonts = mkOption {
      type = types.bool;
      default = true;
      description = "Install Dejavu Fonts.";
    };

    enable-freefont = mkOption {
      type = types.bool;
      default = true;
      description = "Install GNU Free Font.";
    };

    enable-hack = mkOption {
      type = types.bool;
      default = true;
      description = "Install Hack font.";
    };

    enable-iosevka = mkOption {
      type = types.bool;
      default = true;
      description = "Install Iosevka font.";
    };

    enable-ipafont = mkOption {
      type = types.bool;
      default = true;
      description = "Install IPAfont.";
    };

    enable-nerdfonts = mkOption {
      type = types.bool;
      default = true;
      description = "Install Nerd Fonts.";
    };

    enable-noto-fonts = mkOption {
      type = types.bool;
      default = true;
      description = "Install Noto Fonts.";
    };

    enable-source-code-pro = mkOption {
      type = types.bool;
      default = true;
      description = "Install Source Code Pro font.";
    };

    enable-source-han = mkOption {
      type = types.bool;
      default = true;
      description = "Install Source Han fonts.";
    };
  };

  config = mkMerge [
    (mkIf (cfg.enable && cfg.enable-arphic) {
      fonts.fonts = with pkgs; [
        arphic-ukai arphic-uming
      ];
    })

    (mkIf (cfg.enable && cfg.enable-cascadia-code) {
      fonts.fonts = with pkgs; [
        cascadia-code
      ];
    })

    (mkIf (cfg.enable && cfg.enable-dejavu-fonts) {
      fonts.fonts = with pkgs; [
        dejavu_fonts
      ];
    })

    (mkIf (cfg.enable && cfg.enable-freefont) {
      fonts.fonts = with pkgs; [
        freefont_ttf
      ];
    })

    (mkIf (cfg.enable && cfg.enable-hack) {
      fonts.fonts = with pkgs; [
        hack-font
      ];
    })

    (mkIf (cfg.enable && cfg.enable-iosevka) {
      fonts.fonts = with pkgs; [
        iosevka
      ];
    })

    (mkIf (cfg.enable && cfg.enable-ipafont) {
      fonts.fonts = with pkgs; [
        ipafont
      ];
    })

    (mkIf (cfg.enable && cfg.enable-nerdfonts) {
      fonts.fonts = with pkgs; [
        nerdfonts
      ];
    })

    (mkIf (cfg.enable && cfg.enable-noto-fonts) {
      fonts.fonts = with pkgs; [
        noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji
      ];
    })

    (mkIf (cfg.enable && cfg.enable-source-code-pro) {
      fonts.fonts = with pkgs; [
        source-code-pro
      ];
    })

    (mkIf (cfg.enable && cfg.enable-source-han) {
      fonts.fonts = with pkgs; [
        source-han-sans source-han-mono source-han-serif
      ];
    })
  ];
}
