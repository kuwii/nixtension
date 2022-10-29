{ config, lib, pkgs, ... }:

{
  imports = [
    ./compression-software
    ./joplin
    ./neovim
  ];
}
