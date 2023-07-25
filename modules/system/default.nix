{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./clash
    ./cn-support
    ./font
    ./kvm
    ./kvm-guest
    ./openssh
    ./pinyin
    ./sound
    ./tools
    ./windows-time
    ./user
    ./zsh
  ];
}
