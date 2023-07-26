{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    ./packages
    ./modules
  ];
}
