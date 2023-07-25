{ config, lib, pkgs, ... }:

{
  imports = [
    ./compression-software
    ./git
    ./joplin
    ./neovim
  ];
}
