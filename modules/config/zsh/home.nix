{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.config.zsh;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    (mkIf cfg.enable {
      programs.zsh.enable = true;
    })
    (mkIf (cfg.enable && cfg.completion.enable) {
      programs.zsh.enableCompletion = true;
    })
    (mkIf (cfg.enable && cfg.vte-integration.enable) {
      programs.zsh.enableVteIntegration = true;
    })
    (mkIf (cfg.enable && cfg.autosuggestions.enable) {
      programs.zsh.autosuggestion.enable = true;
    })
    (mkIf (cfg.enable && cfg.oh-my-zsh.enable) {
      programs.zsh.oh-my-zsh.enable = true;
      programs.zsh.oh-my-zsh.theme = "ys";
      programs.zsh.oh-my-zsh.plugins = ["man" "git" "rsync"];
    })
  ];
}
