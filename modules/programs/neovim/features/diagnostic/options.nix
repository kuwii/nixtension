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
        default = "<space>de";
        description = "Shortcut to toggle diagnostic.";
      };
      refresh = mkOption {
        type = types.str;
        default = "<space>dR";
        description = "Shortcut to refresh diagnostic.";
      };
    };
  };
}
