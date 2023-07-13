{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    ./features/basic-settings/config.nix
    ./features/status-bar/config.nix
    ./features/explorer/config.nix
    ./features/terminal/config.nix
    ./features/current-word/config.nix
    ./features/nix/config.nix
    ./features/markdown/config.nix
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

    vimrc = mkOption {
      type = types.lines;
      default = "";
      description = "Vimrc of neovim.";
    };
  };
}
