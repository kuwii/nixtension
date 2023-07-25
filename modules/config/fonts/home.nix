{ config, lib, ... }:

let
  cfg = config.nixtension.config.fonts;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./options.nix ];

  config = mkMerge [
    (mkIf (cfg != []) {
      fonts.fontconfig.enable = true;
    })
    ({
      home.packages = cfg;
    })
  ];
}
