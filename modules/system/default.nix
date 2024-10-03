{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./clash
    ./cn-support
    ./font
    ./mihomo
    ./kvm
    ./kvm-guest
    ./openssh
    ./pinyin
    ./sddm
    ./sound
    ./tools
    ./windows-time
    ./user
    ./zsh
  ];
}
