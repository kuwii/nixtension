{ config, lib, pkgs, ... }:

{
  config = {
      services.xserver.enable = true;
      services.libinput.enable = true;
      services.libinput.touchpad.tapping = true;
      programs.dconf.enable = true;
      programs.xwayland.enable = true;
      hardware.bluetooth.enable = true;
      networking.networkmanager.enable = true;
  };
}
