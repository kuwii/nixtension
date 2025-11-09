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

    arphic = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Arphic fonts.";
      };
    };

    cascadia-code = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Cascadia Code font.";
      };
    };

    dejavu-fonts = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Dejavu Fonts.";
      };
    };

    freefont = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install GNU Free Font.";
      };
    };

    hack = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Hack font.";
      };
    };

    ipafont = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install IPAfont.";
      };
    };

    nerdfonts = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Nerd Fonts.";
      };
    };

    noto-fonts = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Noto Fonts.";
      };
    };

    source-code-pro = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Source Code Pro font.";
      };
    };

    source-han = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Source Han fonts.";
      };
    };

    wqy = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install Wen Quan Yi fonts.";
      };
    };
  };

  config = mkMerge [
    (mkIf (cfg.enable && cfg.arphic.enable) {
      nixtension.config.fonts = with pkgs; [
        arphic-ukai arphic-uming
      ];
    })

    (mkIf (cfg.enable && cfg.cascadia-code.enable) {
      nixtension.config.fonts = with pkgs; [
        cascadia-code
      ];
    })

    (mkIf (cfg.enable && cfg.dejavu-fonts.enable) {
      nixtension.config.fonts = with pkgs; [
        dejavu_fonts
      ];
    })

    (mkIf (cfg.enable && cfg.freefont.enable) {
      nixtension.config.fonts = with pkgs; [
        freefont_ttf
      ];
    })

    (mkIf (cfg.enable && cfg.hack.enable) {
      nixtension.config.fonts = with pkgs; [
        hack-font
      ];
    })

    (mkIf (cfg.enable && cfg.ipafont.enable) {
      nixtension.config.fonts = with pkgs; [
        ipafont
      ];
    })

    (mkIf (cfg.enable && cfg.nerdfonts.enable) {
      nixtension.config.nerd-fonts.enable = true;
    })

    (mkIf (cfg.enable && cfg.noto-fonts.enable) {
      nixtension.config.fonts = with pkgs; [
        noto-fonts noto-fonts-cjk-sans noto-fonts-color-emoji
      ];
    })

    (mkIf (cfg.enable && cfg.source-code-pro.enable) {
      nixtension.config.fonts = with pkgs; [
        source-code-pro
      ];
    })

    (mkIf (cfg.enable && cfg.source-han.enable) {
      nixtension.config.fonts = with pkgs; [
        source-han-sans source-han-mono source-han-serif
      ];
    })

    (mkIf (cfg.enable && cfg.wqy.enable) {
      nixtension.config.fonts = with pkgs; [
        wqy_zenhei wqy_microhei
      ];
    })
  ];
}
