{ config, pkgs }:

let
  cfg = config.nixtension.programs.neovim.nvim-lspconfig;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings [
    "__GOTO_DECLARATION__" "__GOTO_DEFINITION__" "__GOTO_IMPL__"
    "__HOVER__"
  ] [
    keymap.goto-declaration keymap.goto-definition keymap.goto-implementation
    keymap.hover
  ];
in
(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ nvim-lspconfig ];
  init-lua = withConfig (builtins.readFile ./init.lua);
})
