{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.explorer = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide file explorer feature.";
    };

    keymap = {
      toggle = mkOption {
        type = types.str;
        default = "<space>E";
        description = "Shortcut to open/close file explorer";
      };
      focus = mkOption {
        type = types.str;
        default = "<space>e";
        description = "Shortcut to focus on file explorer";
      };
    };
  };
}
