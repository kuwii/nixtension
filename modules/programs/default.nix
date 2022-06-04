{ config, lib, pkgs, ... }:

{
  imports = [
    ./compression
    ./neovim
  ];
}
