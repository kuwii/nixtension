{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    markdown-preview-nvim
    vim-markdown
  ];
  vimrc = builtins.readFile ./vimrc.vim;
})
