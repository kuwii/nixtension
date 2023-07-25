{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.programs.neovim.bash-support = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide Bash support.";
    };
  };
}
