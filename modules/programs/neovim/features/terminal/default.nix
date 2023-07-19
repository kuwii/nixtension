{ config, lib, pkgs }:

let
  cfg = config.nixtension.programs.neovim.terminal;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings [
    "__direction__"
    "__TOGGLE__" "__UNFOCUS__"
  ] [
    cfg.direction
    keymap.toggle keymap.unfocus
  ];
in
(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ toggleterm-nvim ];
  init-lua = withConfig (builtins.readFile ./init.lua);
})
