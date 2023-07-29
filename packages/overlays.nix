[(final: prev: {
  nixtension = {
    run-polkit-kde-agent = prev.callPackage (import ./run-polkit-kde-agent) {};
    waybar-hyprland = prev.callPackage (import ./waybar-hyprland) {};
  };
})]
