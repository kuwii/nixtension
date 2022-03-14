{ config, lib, pkgs, ... }:

{
  imports = [
    ./font
    ./grub
    ./kvm
    ./kvm-guest
    ./pinyin
  ];
}
