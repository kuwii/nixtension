{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./clash
    ./font
    ./kvm
    ./kvm-guest
    ./pinyin
    ./sound
    ./tools
    ./zsh
  ];
}
