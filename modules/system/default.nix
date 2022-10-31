{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./clash
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
