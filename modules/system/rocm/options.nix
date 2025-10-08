{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.system.rocm.driver = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Setup basic driver for ROCm.";
    };
  };
}
