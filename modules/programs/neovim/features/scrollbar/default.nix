{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ nvim-scrollbar ];
    init-lua = builtins.readFile ./init.lua;
})
