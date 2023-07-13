{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.terminal = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provides terminal related features.";
    };
    direction = mkOption {
      type = types.str;
      default = "horizontal";
      description = "Where to pop-up terminal. Can be `vertical`, `horizontal`, `tab`, `float`.";
    };
  };
}
