{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.boot;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.boot = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Use Nixtension bootloader configurations based on GRUB. Currently only EFI is supported.";
    };
    enable-bootscreen = mkOption {
      type = types.bool;
      default = true;
      description = "Enable bootscreen based on Plymouth.";
    };
    mountPoint = mkOption {
      type = types.str;
      default = "/boot/efi";
      description = "Location of the mounted EFI partition.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      boot.loader.grub.enable = true;
      boot.loader.grub.version = 2;
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.device = "nodev";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = cfg.mountPoint;
    })
    (mkIf (cfg.enable && cfg.enable-bootscreen) {
      boot.plymouth.enable = true;
    })
  ];
}
