{ config, pkgs, ... }:

let
  cfg = config.nixtension.config;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    ({fonts.packages = cfg.fonts;})
    (mkIf (cfg.nerd-fonts.enable) {
      fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
    })
  ];
}
