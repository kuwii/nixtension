{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    nvim-tree-lua nvim-web-devicons
  ];
  vimrc = builtins.readFile ./vimrc.vim;
})
