{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.status-bar = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide status bar feature.";
    };
  };
}
