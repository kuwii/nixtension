{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.usb-drive;
  inherit (lib) mkIf mkOption types;
in
{
  options.nixtension.system.usb-drive = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable optimized support for USB drive experience.";
    };
    mount-options = mkOption {
      type = types.str;
      default = "flush";
      description = "Options used to mount a USB drive. By default use \"flush\" to sync IO quickly.";
    };
  };

  config = (mkIf cfg.enable {
    services.udisks2.enable = true;
    services.udisks2.settings = {
      "filesystems" = {
        "vfat" = {
          "mount_options" = cfg.mount-options;
        };
        "exfat" = {
          "mount_options" = cfg.mount-options;
        };
        "ntfs" = {
          "mount_options" = cfg.mount-options;
        };
      };
    };
  });
}
