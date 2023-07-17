{ lib, pkgs, ... }:

lib.mkMerge [
  (import ../build-feature.nix {
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua nvim-web-devicons
    ];
    init-vim = builtins.readFile ./init.vim;
    init-lua = builtins.readFile ./init.lua;
  })
  ({
    nixtension.config.fonts = with pkgs; [
      nerdfonts
    ];
  })
]
