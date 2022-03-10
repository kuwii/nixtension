{ config, lib, pkgs, ... }:

{
  imports = [
    ./grub
    ./kvm-guest
    ./pinyin
    ./microsoft-edge
  ];
}
