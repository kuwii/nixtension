{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.openssh;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.openssh = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable OpenSSH support with recommended configurations.";
    };
    password-auth = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Specifies whether password authentication is allowed.";
      };
    };
  };

  config = (mkIf cfg.enable {
    services.openssh.enable = true;
    services.openssh.forwardX11 = true;
    services.openssh.allowSFTP = true;
    services.openssh.settings.PasswordAuthentication = cfg.password-auth.enable;
  });
}
