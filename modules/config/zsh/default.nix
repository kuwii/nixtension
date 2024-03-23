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
      users.defaultUserShell = pkgs.zsh;
    })
    (mkIf (cfg.enable && cfg.completion.enable) {
      programs.zsh.enableCompletion = true;
      programs.zsh.enableBashCompletion = true;
      programs.zsh.enableGlobalCompInit = true;
    })
    (mkIf (cfg.enable && cfg.vte-integration.enable) {
      programs.zsh.vteIntegration = true;
    })
    (mkIf (cfg.enable && cfg.autosuggestions.enable) {
      programs.zsh.autosuggestions.enable = true;
      programs.zsh.autosuggestions.async = true;
      programs.zsh.autosuggestions.strategy = ["history" "completion"];
    })
    (mkIf (cfg.enable && cfg.oh-my-zsh.enable) {
      programs.zsh.ohMyZsh.enable = true;
      programs.zsh.ohMyZsh.theme = "ys";
      programs.zsh.ohMyZsh.plugins = ["man" "git" "rsync"];
    })
  ];
}
