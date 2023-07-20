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
      toggle-delete = mkOption {
        type = types.str;
        default = "<space>gd";
        description = "Shortcut to toggle git blame.";
      };

      hunk-preview = mkOption {
        type = types.str;
        default = "<space>gp";
        description = "Shortcut to preview hunk at current position.";
      };
      hunk-inline = mkOption {
        type = types.str;
        default = "<space>gi";
        description = "Shortcut to preview hunk at current position inline.";
      };
      hunk-previous = mkOption {
        type = types.str;
        default = "<space>gj";
        description = "Shortcut to jump to previous hunk in the current buffer.";
      };
      hunk-next = mkOption {
        type = types.str;
        default = "<space>gk";
        description = "Shortcut to jump to next hunk in the current buffer.";
      };

      diff = mkOption {
        type = types.str;
        default = "<space>gc";
        description = "Shortcut to perform a vimdiff on current file.";
      };
    };
  };
}
