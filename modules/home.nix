{ config, lib, pkgs, ... }:

{
  imports = [
    ./config/home.nix
    ./programs
  ];
}
