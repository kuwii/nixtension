{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.kvm;
  inherit (lib) mkOption types;
in
{
  options.nixtension.system.kvm = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Nixtension KVM support, including QEMU, libvirtd, virt-manager and other utils.";
    };

    windows-guest-support = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable Windows guest support, installing necessary dependencies.";
      };
    };
  };
}
