{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.config.git;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    (mkIf cfg.enable {
      programs.git.enable = true;
    })
    (mkIf (cfg.enable && cfg.lfs.enable) {
      programs.git.lfs.enable = true;
    })
    (mkIf (cfg.enable && cfg.delta.enable) {
      programs.delta.enable = true;
    })
  ];
}
