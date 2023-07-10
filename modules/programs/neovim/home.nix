{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    ./config.nix
  ];

  config = mkMerge [
    (mkIf cfg.enable {
      programs.neovim.enable = true;

      programs.neovim.defaultEditor = true;

      programs.neovim.viAlias = true;
      programs.neovim.vimAlias = true;
      programs.neovim.vimdiffAlias = true;

      programs.neovim.withPython3 = true;
      programs.neovim.withNodeJs = true;
      programs.neovim.withRuby = true;

      programs.neovim.plugins = cfg.plugins;
      programs.neovim.extraConfig = cfg.vimrc;
    })

    (mkIf (cfg.enable && cfg.basic-settings.enable) (import ./features/basic-settings { }))
    (mkIf (cfg.enable && cfg.explorer.enable) (import ./features/explorer/home.nix { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.nix-support.enable) (import ./features/nix { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.status-bar.enable) (import ./features/status-bar { inherit pkgs; }))
  ];
}