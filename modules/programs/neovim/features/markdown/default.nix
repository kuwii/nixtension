{ config, lib, pkgs }:

let
  cfg = config.nixtension.programs.neovim.markdown;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings [
    "__TOGGLE__"
  ] [
    keymap.toggle
  ];
in
(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    markdown-preview-nvim
    vim-markdown
  ];
  init-vim = withConfig (builtins.readFile ./init.vim);
})
