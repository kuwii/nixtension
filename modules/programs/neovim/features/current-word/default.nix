{ config, pkgs }:

let
  cfg = config.nixtension.programs.neovim.current-word;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings [
    "__TOGGLE__"
  ] [
    keymap.toggle
  ];
in
(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ vim_current_word ];
  init-vim = withConfig (builtins.readFile ./init.vim);
})
