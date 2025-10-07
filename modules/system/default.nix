{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./clash
    ./cn-support
    ./font
    ./hostname
    ./input
    ./kvm
    ./kvm-guest
    ./mihomo
    ./openssh
    ./pinyin
    ./podman
    ./sddm
    ./sound
    ./tools
    ./windows-time
    ./usb-drive
    ./user
    ./zsh
  ];
}
