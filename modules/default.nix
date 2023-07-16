{ config, lib, pkgs, ... }:

{
  imports = [
    ./config
    ./desktop
    ./system
    ./programs
  ];
}
