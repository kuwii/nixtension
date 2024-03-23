{ config, lib, pkgs, ... }:

{
  imports = [
    ./config/home.nix
    ./system/home.nix
    ./programs
  ];
}
