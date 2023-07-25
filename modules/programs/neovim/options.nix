{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    # basic features
    ./features/basic-settings/options.nix
    ./features/status-bar/options.nix
    ./features/explorer/options.nix
    ./features/git/options.nix
    ./features/fuzzy-finder/options.nix
    ./features/terminal/options.nix
    ./features/current-word/options.nix
    ./features/markdown/options.nix
    ./features/diagnostic/options.nix
    # language supports
    ./features/nvim-lspconfig/options.nix
    ./features/lua-support/options.nix
    ./features/nix-support/options.nix
    ./features/bash-support/options.nix
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
