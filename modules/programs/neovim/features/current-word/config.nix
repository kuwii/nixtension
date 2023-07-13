{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.current-word = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that highlight current word.";
    };
  };
}
