{ }:

(import ../build-feature.nix {
  vimrc = builtins.readFile ./vimrc.vim;
})
