{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim.explorer;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings [
    "__TOGGLE__" "__FOCUS__"
  ] [
    keymap.toggle keymap.focus
  ];
in
lib.mkMerge [
  (import ../build-feature.nix {
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua nvim-web-devicons
    ];
    init-vim = withConfig (builtins.readFile ./init.vim);
    init-lua = withConfig (builtins.readFile ./init.lua);
  })
  ({
    nixtension.config.fonts = with pkgs; [
      nerdfonts
    ];
  })
]
