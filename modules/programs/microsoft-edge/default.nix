{ config, lib, pkgs, ... }:

let
  cfg = config.nixt.programs;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixt.programs.microsoft-edge = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Microsoft Edge.";
    };
  };
  options.nixt.programs.microsoft-edge-beta = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Microsoft Edge beta channel version.";
    };
  };
  options.nixt.programs.microsoft-edge-dev = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Microsoft Edge dev channel version.";
    };
  };

  config = mkMerge [
    (mkIf cfg.microsoft-edge.enable {
      environment.systemPackages = with pkgs.nixt; [ microsoft-edge ];
    })
    (mkIf cfg.microsoft-edge-beta.enable {
      environment.systemPackages = with pkgs.nixt; [ microsoft-edge-beta ];
    })
    (mkIf cfg.microsoft-edge-dev.enable {
      environment.systemPackages = with pkgs.nixt; [ microsoft-edge-dev ];
    })
  ];
}
