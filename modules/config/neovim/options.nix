{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.config.neovim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable Neovim.";
    };

    defaultEditor = mkOption {
      type = types.bool;
      default = false;
      description = "Set Neovim as default editor.";
    };

    withPython3 = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Python 3 provider";
    };

    withNodeJs = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Node provider";
    };

    withRuby = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Ruby provider";
    };

    alias = mkOption {
      type = types.bool;
      default = false;
      description = "Set aliases for Neovim.";
    };

    plugins = mkOption {
      type =  types.listOf types.package;
      default = [];
      description = "Plugins to install for Neovim.";
    };

    vimrc = mkOption {
      type = types.lines;
      default = "";
      description = "vimrc of Neovim.";
    };
  };
}
