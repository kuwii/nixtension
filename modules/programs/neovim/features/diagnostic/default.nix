{ config, lib, pkgs }:

let
  cfg = config.nixtension.programs.neovim.diagnostic;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings ([
    "__TOGGLE__" "__REFRESH__"
    "__OPEN_DOCUMENT__" "__OPEN_WORKSPACE__" "__OPEN_QUICKFIX__" "__OPEN_LOCLIST__"
    "__OPEN_REFERENCES__" "__OPEN_DEFINITIONS__" "__OPEN_TYPE_DEFINITIONS__"
  ]) (with keymap; [
    toggle refresh
    open-document open-workspace open-quickfix open-loclist
    open-references open-definitions open-type-references
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
