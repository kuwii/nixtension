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
    ./pinyin
    ./sound
    ./tools
    ./zsh
  ];
}
