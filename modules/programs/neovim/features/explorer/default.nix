{ pkgs }:

(import ./feature.nix { inherit pkgs; }) // {
  fonts.fonts = with pkgs; [
    nerdfonts
  ];
}
