{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    vim-airline vim-airline-clock
  ];
})
