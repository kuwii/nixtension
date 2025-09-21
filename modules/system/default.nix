{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./clash
    ./cn-support
    ./font
    ./hostname
    ./kvm
    ./kvm-guest
    ./mihomo
    ./openssh
    ./pinyin
    ./sddm
    ./sound
    ./tools
    ./windows-time
    ./usb-drive
    ./user
    ./zsh
  ];
}
