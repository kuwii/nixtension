{ config, lib, pkgs }:

let
  cfg = config.nixtension.programs.neovim.diagnostic;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings ([
    "__TOGGLE__" "__REFRESH__"
  ]) (with keymap; [
    toggle refresh
  ]);
in
lib.mkMerge [
  (import ../build-feature.nix {
    plugins = with pkgs.vimPlugins; [
      trouble-nvim
      lsp-colors-nvim
      nvim-web-devicons
    ];
    init-lua = withConfig (builtins.readFile ./init.lua);
  })
  ({
    nixtension.config.fonts = with pkgs; [
      nerdfonts
    ];
  })
]
