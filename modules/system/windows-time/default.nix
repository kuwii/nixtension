{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.windows-time;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.windows-time = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Fix gap of Linux and Windows showing different times.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      time.hardwareClockInLocalTime = true;
    })
  ];
}
