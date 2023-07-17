{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ vim_current_word ];
  init-vim = builtins.readFile ./init.vim;
})
