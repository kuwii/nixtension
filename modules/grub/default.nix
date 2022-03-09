{ config, lib, pkgs, ... }:

let
  cfg = config.nixt.system.grub;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixt.system.grub = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Use GRUB as the bootloader. Currently only EFI is supported.";
    };
    mountPoint = mkOption {
      type = types.str;
      default = "/boot/efi";
      description = "Location of the mounted EFI partition.";
    };
  };

  config = (mkIf cfg.enable {
    boot.loader.grub.enable = true;
    boot.loader.grub.version = 2;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.device = "nodev";
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = cfg.mountPoint; 
  });
}
