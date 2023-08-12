
{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.scrollbar= {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugin that provides scrollbar feature.";
    };
  };
}
