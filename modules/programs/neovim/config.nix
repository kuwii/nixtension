{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    # basic features
    ./features/basic-settings/config.nix
    ./features/status-bar/config.nix
    ./features/explorer/config.nix
    ./features/git/config.nix
    ./features/fuzzy-finder/config.nix
    ./features/terminal/config.nix
    ./features/current-word/config.nix
    ./features/markdown/config.nix
    # language supports
    ./features/nvim-lspconfig/config.nix
    ./features/lua-support/config.nix
    ./features/nix-support/config.nix
  ];

  options.nixtension.programs.neovim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Neovim with recommended plugins.";
    };

    plugins = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Plugins to install.";
    };

    init-vim = mkOption {
      type = types.lines;
      default = "";
      description = "init.vim of Neovim.";
    };

    init-lua = mkOption {
      type = types.lines;
      default = "";
      description = "init.lua of Neovim.";
    };
  };
}
