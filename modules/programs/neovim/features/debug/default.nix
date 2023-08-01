{ config, pkgs }:

let
  cfg = config.nixtension.programs.neovim.current-word;
in
(import ../build-feature.nix {
  plugins = with pkgs.vimPlugins; [ nvim-dap ];
})
