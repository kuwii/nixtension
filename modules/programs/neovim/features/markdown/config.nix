{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.markdown = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide markdown support.";
    };

    keymap = {
      toggle = mkOption {
        type = types.str;
        default = "<space>p";
        description = "Shortcut to open/close Markdown preview page.";
      };
    };
  };
}
