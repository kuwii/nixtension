{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    markdown-preview-nvim
    vim-markdown
  ];
  init-vim = builtins.readFile ./init.vim;
})
