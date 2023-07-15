{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ ];
  init-lua = builtins.readFile ./init.lua;
})
