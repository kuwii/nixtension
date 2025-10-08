{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.rocm;
  inherit (lib) mkIf;
in
{
  imports = [
    ./options.nix
  ];

  config = (mkIf (cfg.driver.enable) {
    boot.kernelModules = [ "amdgpu" "kfd" ];

    nixpkgs.config.rocmSupport = true;
    hardware.amdgpu.opencl.enable = true;

    environment.systemPackages = with pkgs; [
      rocmPackages.rocm-core
      rocmPackages.rocm-smi
      rocmPackages.rocminfo
      rocmPackages.amdsmi
      clinfo
    ];
  });
}
