{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.nvim-lspconfig = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install nvim-lspconfig plugin.";
    };
  };
}
