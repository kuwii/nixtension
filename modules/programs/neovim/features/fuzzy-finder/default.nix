{ pkgs }:

(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
  ];
  initLua = builtins.readFile ./init.lua;
}) // {
  environment.systemPackages = with pkgs; [
    ripgrep fd
  ];
}
