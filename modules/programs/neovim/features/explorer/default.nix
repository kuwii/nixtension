{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    nvim-tree-lua nvim-web-devicons
  ];
  init-vim = builtins.readFile ./vimrc.vim;
  init-lua = builtins.readFile ./init.lua;
}) // {
  environment.systemPackages = with pkgs; [
    nerdfonts
  ];
}
