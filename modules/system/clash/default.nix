{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.clash;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.clash = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install and enable Clash service.";
    };
    config-dir = mkOption {
      type = types.str;
      default = "/root/.config/clash";
      description = "Configuration directory of Clash.";
    };
    auto-start = mkOption {
      type = types.bool;
      default = true;
      description = "Auto start clash service.";
    };
  };

  config = (mkIf cfg.enable {
    # install clash
    environment.systemPackages = with pkgs; [
      clash
    ];
    # setup systemd service
    systemd.services.clash = {
      enable = cfg.auto-start;
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      description = "Clash service.";
      script = "${pkgs.clash}/bin/clash -d ${cfg.config-dir}";
      serviceConfig = {
        Type = "simple";
      };
    };
  });
}
