{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.config;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    (mkIf (cfg != []) {
      fonts.fontconfig.enable = true;
    })
    ({
      home.packages = cfg.fonts;
    })
    (mkIf (cfg.nerd-fonts.enable) {
      home.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
    })
  ];
}
