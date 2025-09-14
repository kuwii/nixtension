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
    pulseaudio = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Use PulseAudio instead of PipeWire.";
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      security.rtkit.enable = true;
    })
    (mkIf (cfg.enable && !cfg.pulseaudio.enable) {
      services.pulseaudio.enable = false;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    })
    (mkIf (cfg.enable && cfg.pulseaudio.enable) {
      hardware.pulseaudio.enable = true;
      services.pipewire.enable = false;
      environment.systemPackages = with pkgs; [
        pavucontrol
      ];
    })
  ];
}
