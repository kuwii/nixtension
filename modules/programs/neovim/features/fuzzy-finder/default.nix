{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
  ];
  init-lua = builtins.readFile ./init.lua;
}) // {
  nixtension.config.packages = with pkgs; [
    ripgrep fd
  ];
}
