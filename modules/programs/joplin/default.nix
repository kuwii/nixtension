{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.joplin;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.joplin = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Joplin, an open source note-taking app.";
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      # install the software
      environment.systemPackages = with pkgs; [
        joplin joplin-desktop
      ];
      # install necessary fonts for displaying chinese
      fonts.fonts = with pkgs; [
        wqy_zenhei wqy_microhei
      ];
    })
  ];
}
