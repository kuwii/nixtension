{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  initVim = cfg.init-vim;
  initLua = cfg.init-lua;
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

      programs.neovim.withPython3 = true;
      programs.neovim.withNodeJs = true;
      programs.neovim.withRuby = true;

      nixtension.config.neovim.alias = true;

      nixtension.config.neovim.plugins = cfg.plugins;
      nixtension.config.neovim.vimrc = "lua << EOF\n" + initLua + "\nEOF\n" + initVim;

      nixtension.config.packages = with pkgs; [
        xclip wl-clipboard
      ];
    })

    # basic features
    (mkIf (cfg.enable && cfg.basic-settings.enable) (import ./features/basic-settings { }))
    (mkIf (cfg.enable && cfg.explorer.enable) (import ./features/explorer { inherit lib pkgs; }))
    (mkIf (cfg.enable && cfg.git.enable) (import ./features/git { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.status-bar.enable) (import ./features/status-bar { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.current-word.enable) (import ./features/current-word { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.fuzzy-finder.enable) (import ./features/fuzzy-finder { inherit lib pkgs; }))
    (mkIf (cfg.enable && cfg.terminal.enable) (import ./features/terminal { inherit pkgs config; }))
    (mkIf (cfg.enable && cfg.markdown.enable) (import ./features/markdown { inherit pkgs; }))
    # language supports
    (mkIf (cfg.enable && cfg.nvim-lspconfig.enable) (import ./features/nvim-lspconfig { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.nix-support.enable) (import ./features/nix-support { inherit lib pkgs; }))
    (mkIf (cfg.enable && cfg.lua-support.enable) (import ./features/lua-support { inherit lib pkgs; }))
  ];
}
