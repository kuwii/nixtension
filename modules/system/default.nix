{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./clash
    ./cn-support
    ./font
    ./hardware-tools
    ./kvm
    ./kvm-guest
    ./openssh
    ./pinyin
    ./sound
    ./tools
    ./zsh
  ];
}
