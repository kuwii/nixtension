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

    keymap = {
      goto-declaration = mkOption {
        type = types.str;
        default = "gD";
        description = "Shortcut to jump to the declaration.";
      };
      goto-definition = mkOption {
        type = types.str;
        default = "gd";
        description = "Shortcut jump to the definition.";
      };
      goto-implementation = mkOption {
        type = types.str;
        default = "gi";
        description = "Shortcut to list all the implementations.";
      };

      hover = mkOption {
        type = types.str;
        default = "K";
        description = "Shortcut to display hover information.";
      };
    };
  };
}
