{ config, lib, pkgs, ... }:

{
  imports = [
    ./desktop
    ./system
    ./programs
  ];
}
