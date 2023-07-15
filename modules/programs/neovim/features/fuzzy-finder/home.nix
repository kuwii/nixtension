{ pkgs }:

(import ./feature.nix { inherit pkgs; }) // {
  home.packages = with pkgs; [
    ripgrep fd
  ];
}
