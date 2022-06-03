{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./font
    ./kvm
    ./kvm-guest
    ./pinyin
    ./tools
    ./zsh
  ];
}
