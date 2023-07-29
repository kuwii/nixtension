{ pkgs }:

{
  environment.systemPackages = with pkgs; [
    nixtension.waybar-hyprland
  ];
}
