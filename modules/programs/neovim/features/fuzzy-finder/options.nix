{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.fuzzy-finder = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide fuzzy finder.";
    };

    keymap = {
      files = mkOption {
        type = types.str;
        default = "<space>ff";
        description = "Shortcut to find files.";
      };

      live-grep = mkOption {
        type = types.str;
        default = "<space>fg";
        description = "Shortcut to search a string live.";
      };

      buffers = mkOption {
        type = types.str;
        default = "<space>fb";
        description = "Shortcut to search within buffers.";
      };

      help-tags = mkOption {
        type = types.str;
        default = "<space>fh";
        description = "Shortcut to search within help tags.";
      };
    };
  };
}
