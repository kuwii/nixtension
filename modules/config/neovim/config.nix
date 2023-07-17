{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.config.neovim = {
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
