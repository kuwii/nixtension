{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.system.podman = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Setup Podman.";
    };
  };
}
