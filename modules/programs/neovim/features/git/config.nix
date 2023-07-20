{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.git = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide git support.";
    };

    keymap = {
      toggle = mkOption {
        type = types.str;
        default = "<space>gg";
        description = "Shortcut to toggle git highlight.";
      };
      toggle-number = mkOption {
        type = types.str;
        default = "<space>gn";
        description = "Shortcut to toggle git highlight in number column.";
      };
      toggle-line = mkOption {
        type = types.str;
        default = "<space>gl";
        description = "Shortcut to toggle git highlight in lines.";
      };
      toggle-word = mkOption {
        type = types.str;
        default = "<space>gw";
        description = "Shortcut to toggle git highlight in words.";
      };
      toggle-blame = mkOption {
        type = types.str;
        default = "<space>gb";
        description = "Shortcut to toggle git blame.";
      };
    };
  };
}
