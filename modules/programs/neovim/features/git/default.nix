{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ gitsigns-nvim ];
  init-lua = builtins.readFile ./init.lua;
})
