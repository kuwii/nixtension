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

    user = mkOption {
      type = types.str;
      default = "root";
      description = "Username to use KVM.";
    };

    windows-guest-support = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable Windows guest support, installing necessary dependencies.";
      };
    };

    pci-passthrough = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable PCI passthrough for KVM.";
      };

      cpu-type = mkOption {
        type = types.str;
        default = "unknown";
        description = "intel | amd";
      };
    };
  };
}
