{ config, lib, pkgs, ... }:

{
  imports = [
    ./compression-software
    ./git
    ./hardware-tools
    ./joplin
    ./neovim
    ./system-tools
    ./toys
  ];
}
