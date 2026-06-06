{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.rocm;
  inherit (lib) mkIf;
in
{
  imports = [
    ./options.nix
  ];

  config = (mkIf (cfg.enable) {
    nixtension.system.amd-gpu-driver.enable = true;

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware.amdgpu.opencl.enable = true;

    nixpkgs.config.rocmSupport = true;

    environment.systemPackages = with pkgs; [
      rocmPackages.rocm-core
      rocmPackages.rocm-smi
      rocmPackages.rocminfo
      rocmPackages.amdsmi
      clinfo
    ];
  });
}
