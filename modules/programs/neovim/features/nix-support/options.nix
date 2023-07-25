{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.nix-support = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide Nix support.";
    };
  };
}
