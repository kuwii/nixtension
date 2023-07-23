{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.kvm;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [
    ./config.nix
  ];

  config = mkMerge [
    (mkIf cfg.enable {
      virtualisation.libvirtd.enable = true;
      virtualisation.libvirtd.qemu.swtpm.enable = true;
      virtualisation.libvirtd.qemu.ovmf.enable = true;
      virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
      services.spice-vdagentd.enable = true;

      environment.systemPackages = with pkgs; [
        virt-manager virt-viewer
        spice spice-gtk spice-protocol
      ];
    })
    (mkIf (cfg.enable && cfg.windows-guest-support.enable) {
      environment.systemPackages = with pkgs; [
        looking-glass-client win-virtio win-spice
      ];
    })
    (mkIf (cfg.enable && cfg.pci-passthrough.enable) (
      import ./pci-passthrough.nix { kvm-config = cfg; inherit lib pkgs; }
    ))
  ];
}
