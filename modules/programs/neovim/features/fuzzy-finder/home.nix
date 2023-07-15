{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    vimPlugins.plenary-nvim
    vimPlugins.telescope-nvim
    vimPlugins.telescope-fzf-native-nvim
  ];
  init-lua = builtins.readFile ./init.lua;
})
