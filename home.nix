{ config, lib, pkgs, ... }:

{
  imports = [
    ./packages
    ./modules/home.nix
  ];
}
