{ config, lib, pkgs, ... }:

{
  imports = [
    ./grub
    ./microsoft-edge
  ];
}
