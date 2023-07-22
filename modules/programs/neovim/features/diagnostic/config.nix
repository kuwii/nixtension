{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.diagnostic = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide diagnostic feature.";
    };

    keymap = {
      toggle = mkOption {
        type = types.str;
        default = "<space>dd";
        description = "Shortcut to toggle diagnostic.";
      };
      refresh = mkOption {
        type = types.str;
        default = "<space>dR";
        description = "Shortcut to refresh diagnostic.";
      };
      open-document = mkOption {
        type = types.str;
        default = "<space>do";
        description = "Shortcut to open document diagnostic.";
      };
      open-workspace = mkOption {
        type = types.str;
        default = "<space>dw";
        description = "Shortcut to open workspace diagnostic.";
      };
      open-quickfix = mkOption {
        type = types.str;
        default = "<space>df";
        description = "Shortcut to open quick fix.";
      };
      open-loclist = mkOption {
        type = types.str;
        default = "<space>dl";
        description = "Shortcut to open items from the window's location list.";
      };
      open-references = mkOption {
        type = types.str;
        default = "<space>dr";
        description = "Shortcut to open references from the builtin LSP client";
      };
      open-definitions = mkOption {
        type = types.str;
        default = "<space>dd";
        description = "Shortcut to open definitions from the builtin LSP client";
      };
      open-type-references = mkOption {
        type = types.str;
        default = "<space>dt";
        description = "Shortcut to open type references from the builtin LSP client";
      };
    };
  };
}
