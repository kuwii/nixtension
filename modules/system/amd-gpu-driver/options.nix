{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.system.amd-gpu-driver = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Setup basic driver for AMD GPU.";
    };
  };
}
