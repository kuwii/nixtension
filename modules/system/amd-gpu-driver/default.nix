{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.amd-gpu-driver;
  inherit (lib) mkIf;
in
{
  imports = [
    ./options.nix
  ];

  config = (mkIf (cfg.enable) {
    boot.kernelModules = [ "amdgpu" "kfd" ];
  });
}
