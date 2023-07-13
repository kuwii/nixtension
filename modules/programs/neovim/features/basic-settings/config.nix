{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.basic-settings = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable basic recommended settings.";
    };
  };
}
