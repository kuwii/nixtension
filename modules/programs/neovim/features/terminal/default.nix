{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ toggleterm-nvim ];
  vimrc = builtins.readFile ./vimrc.vim;
  initLua = builtins.readFile ./init.lua;
})
