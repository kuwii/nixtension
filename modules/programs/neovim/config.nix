{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.neovim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Neovim with recommended plugins.";
    };

    basic-settings = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable basic recommended settings.";
      };
    };

    explorer = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install plugins that provide file explorer feature.";
      };
    };

    nix-support = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install plugins that provide Nix support.";
      };
    };

    status-bar = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Install plugins that provide status bar feature.";
      };
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
