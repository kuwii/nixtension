{ lib, pkgs }:

lib.mkMerge [
  (import ../build-feature.nix {
    init-lua = builtins.readFile ./init.lua;
  })
  {
    nixtension.config.packages = with pkgs; [
      nodePackages.bash-language-server
    ];
  }
]
