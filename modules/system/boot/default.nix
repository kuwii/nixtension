{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.boot;
  inherit (lib) assertMsg mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.boot = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Use Nixtension bootloader configurations based on systemd-boot. Currently only EFI is supported.";
    };
    bootscreen = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable bootscreen based on Plymouth.";
      };
    };
    grub = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Use GNU GRUB as bootloader, instead of systemd-boot.";
      };
    };
    mount-point = mkOption {
      type = types.str;
      default = "/boot";
      description = "Location of the mounted EFI partition.";
    };
  };

  config = mkMerge [
    (mkIf (cfg.enable) {
      boot.initrd.systemd.enable = true;
    })
    (mkIf (cfg.enable && !cfg.grub.enable) {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = cfg.mount-point;
    })
    (mkIf (cfg.enable && cfg.grub.enable) {
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.device = "nodev";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.grub.enableCryptodisk = true;
      boot.loader.efi.efiSysMountPoint = cfg.mount-point;
    })
    (mkIf (cfg.enable && cfg.bootscreen.enable) {
      boot.plymouth.enable = true;
    })
  ];
}
