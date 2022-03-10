{ config, lib, pkgs, ... }:

let
  cfg = config.nixt.system.kvm-guest;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixt.system.kvm-guest = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable KVM guest support with SPICE driver.";
    };
  };

  config = (mkIf cfg.enable {
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
  });
}
