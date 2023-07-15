{ }:

(import ../build-feature.nix {
  init-vim = builtins.readFile ./vimrc.vim;
})
