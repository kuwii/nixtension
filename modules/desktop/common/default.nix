{ lib, ... }:

let
  inherit (lib) mkDefault;
in
{
  config = {
      services.xserver.enable = mkDefault true;
      services.xserver.xkb = {
        layout = mkDefault "us";
        variant = mkDefault "";
      };

      services.libinput.enable = mkDefault true;
      services.libinput.touchpad.tapping = mkDefault true;

      programs.dconf.enable = mkDefault true;
      programs.xwayland.enable = mkDefault true;

      i18n.defaultLocale = mkDefault "en_US.UTF-8";

      hardware.bluetooth.enable = mkDefault true;
      networking.networkmanager.enable = mkDefault true;
  };
}
