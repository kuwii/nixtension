{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.zsh;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.zsh = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Nixtension Zsh support, including Zsh, Oh My Zsh and some useful plugins and settings.";
    };
    vi-mode = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable vi mode support.";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      nixtension.config.zsh.enable = true;
      nixtension.config.zsh.completion.enable = true;
      nixtension.config.zsh.vte-integration.enable = true;
      nixtension.config.zsh.autosuggestions.enable = true;
      nixtension.config.zsh.oh-my-zsh.enable = true;

      nixtension.config.packages = with pkgs; [
        fzf
      ];
    })
    # (mkIf (cfg.enable && cfg.vi-mode.enable) {
    #   programs.zsh.ohMyZsh.plugins = [ "vi-mode" ];
    #   programs.zsh.setOptions = [ "VI" ];
    #   programs.zsh.interactiveShellInit = ''
    #     export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true;
    #     export VI_MODE_SET_CURSOR=true;
    #   '';
    # })
  ];
}
