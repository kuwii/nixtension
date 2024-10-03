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
    auto-start = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Auto start clash service.";
      };
    };
    config-dir = mkOption {
      type = types.str;
      default = "/root/.config/clash";
      description = "Configuration directory of Clash.";
    };
  };

  config = (mkIf cfg.enable {
    assertions = [{
      assertion = false;
      message = "'clash' has been deprecated. Please use 'nixtension.system.mihomo' instead.";
    }];
  });
}
