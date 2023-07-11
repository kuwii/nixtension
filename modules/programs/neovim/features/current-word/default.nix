{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ vim_current_word ];
  vimrc = builtins.readFile ./vimrc.vim;
})
