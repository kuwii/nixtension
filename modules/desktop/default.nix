{ config, lib, pkgs, ... }:

{
  imports = [
    ./gnome
    ./hyprland
    ./kde
  ];
}
