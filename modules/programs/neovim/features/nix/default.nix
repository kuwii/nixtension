{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ vim-nix ];
})
