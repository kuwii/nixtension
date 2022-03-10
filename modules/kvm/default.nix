{ config, lib, pkgs, ... }:

let
  cfg = config.nixt.system.kvm;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixt.system.kvm = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Nixt KVM support, including QEMU, libvirtd, virt-manager and other utils.";
    };
  };

  config = (mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;
    virtualisation.libvirtd.qemu.ovmf.enable = true;
    virtualisation.libvirtd.qemu.ovmf.package = pkgs.OVMFFull;
    services.spice-vdagentd.enable = true;

    environment.systemPackages = with pkgs; [
      virt-manager virt-viewer
      spice spice-gtk spice-protocol
      win-virtio win-spice
    ];
  });
}
