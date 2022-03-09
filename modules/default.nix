{ config, lib, pkgs, ... }:

{
  imports = [
    ./grub
    ./pinyin
    ./microsoft-edge
  ];
}
