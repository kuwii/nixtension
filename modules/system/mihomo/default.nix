{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.mihomo;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.mihomo = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install and enable Mihomo service.";
    };
    auto-start = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Auto start Mihomo service.";
      };
    };
    config-dir = mkOption {
      type = types.str;
      default = "/root/.config/clash";
      description = "Configuration directory of Mihomo.";
    };
  };

  config = (mkIf cfg.enable {
    # install mihomo
    environment.systemPackages = with pkgs; [
      mihomo
    ];
    # setup systemd service
    systemd.services.mihomo = {
      enable = cfg.auto-start.enable;
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      description = "Mihomo service.";
      script = "${pkgs.mihomo}/bin/mihomo -d ${cfg.config-dir}";
      serviceConfig = {
        Type = "simple";
      };
    };
  });
}
