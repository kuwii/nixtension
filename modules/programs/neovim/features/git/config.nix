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
  };
}
