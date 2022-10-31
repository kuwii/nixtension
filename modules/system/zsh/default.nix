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
      programs.zsh.enable = true;

      programs.zsh.enableCompletion = true;
      programs.zsh.enableBashCompletion = true;
      programs.zsh.enableGlobalCompInit = true;

      programs.zsh.autosuggestions.enable = true;
      programs.zsh.autosuggestions.async = true;
      programs.zsh.autosuggestions.strategy = ["history" "completion"];

      programs.zsh.ohMyZsh.enable = true;
      programs.zsh.ohMyZsh.theme = "ys";
      programs.zsh.ohMyZsh.plugins = [
        "man" "git" "rsync"
      ];

      users.defaultUserShell = pkgs.zsh;
      environment.systemPackages = with pkgs; [
        fzf
      ];
    })
    (mkIf (cfg.enable && cfg.vi-mode.enable) {
      programs.zsh.ohMyZsh.plugins = [ "vi-mode" ];
      programs.zsh.setOptions = [ "VI" ];
      programs.zsh.interactiveShellInit = ''
        export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true;
        export VI_MODE_SET_CURSOR=true;
      '';
    })
  ];
}
