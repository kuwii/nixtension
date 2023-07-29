{ waybar }:

waybar.overrideAttrs (oldAttrs: {
  mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
})
