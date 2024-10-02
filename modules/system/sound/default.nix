{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.system.sound;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.system.sound = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable sound support.";
    };
  };

  config = (mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  });
}
