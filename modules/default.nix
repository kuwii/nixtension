{ config, lib, pkgs, ... }:

{
  imports = [
    ./grub
    ./kvm
    ./kvm-guest
    ./pinyin
    ./microsoft-edge
  ];
}
