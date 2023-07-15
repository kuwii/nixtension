{ pkgs, config }:

let
  withConfig = builtins.replaceStrings [
    "__direction__"
  ] [
    config.nixtension.programs.neovim.terminal.direction
  ];
in
(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ toggleterm-nvim ];
  init-vim = builtins.readFile ./vimrc.vim;
  init-lua = withConfig (builtins.readFile ./init.lua);
})
