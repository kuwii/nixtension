{ kvm-config, lib, pkgs, ... }:

let
  username = kvm-config.user;
  cfg = kvm-config.pci-passthrough;
  cpu-type = cfg.cpu-type;
  inherit (lib) mkMerge mkIf;
in
mkMerge [
  (mkIf cfg.enable {
    boot.kernelModules = [
      "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd"
    ];
    boot.kernelParams = [
      "iommu=pt"
    ];
    environment.systemPackages = with pkgs; [
      looking-glass-client
    ];
    systemd.tmpfiles.rules = [
      "f /dev/shm/looking-glass 0660 ${username} qemu-libvirtd -"
    ];
  })
  (mkIf (cfg.enable && cfg.cpu-type == "intel") {
    boot.kernelParams = [
      "intel_iommu=on" "kvm-intel"
    ];
  })
  (mkIf (cfg.enable && cfg.cpu-type == "amd") {
    boot.kernelParams = [
      "amd_iommu=on" "kvm-amd"
    ];
  })
]
