{ }:

(import ../build-feature.nix {
  init-vim = builtins.readFile ./init.vim;
})
