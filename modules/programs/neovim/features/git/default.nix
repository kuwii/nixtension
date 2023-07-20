{ config, lib, pkgs }:

let
  cfg = config.nixtension.programs.neovim.git;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings [
    "__TOGGLE_SIGNS__"
    "__TOGGLE_NUMHL__" "__TOGGLE_LINEHL__" "__TOGGLE_WORD_DIFF__" "__TOGGLE_BLAME__" "__TOGGLE_DELETE__"
    "__HUNK_PREVIEW__" "__HUNK_INLINE__" "__HUNK_PREV__" "__HUNK_NEXT__"
    "__DIFF__"
  ] [
    keymap.toggle
    keymap.toggle-number keymap.toggle-line keymap.toggle-word keymap.toggle-blame keymap.toggle-delete
    keymap.hunk-preview keymap.hunk-inline keymap.hunk-previous keymap.hunk-next
    keymap.diff
  ];
in
(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ gitsigns-nvim ];
  init-vim = withConfig (builtins.readFile ./init.vim);
  init-lua = withConfig (builtins.readFile ./init.lua);
})
