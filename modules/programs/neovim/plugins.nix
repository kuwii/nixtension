{ pkgs }:

with pkgs.vimPlugins; {
  start = [
    vim-nix
  ];
}
