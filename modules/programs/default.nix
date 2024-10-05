{ config, lib, ... }:

let
  cfg = config.nixtension.programs;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    ./compression-software
    ./git
    ./hardware-tools
    ./joplin
    ./neovim
    ./system-tools
    ./toys
  ];

  options.nixtension.programs = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install supported programs.";
    };

    enable-cli = mkOption {
      type = types.bool;
      default = false;
      description = "Install supported command line programs.";
    };
  };

  config = mkMerge [
    (mkIf (cfg.enable || cfg.enable-cli) {
      nixtension.programs = {
        compression-software.enable = true;
        git.enable = true;
        hardware-tools.enable = true;
        neovim.enable = true;
        system-tools.enable = true;
        toys.enable = true;
      };
    })
    (mkIf cfg.enable {
      nixtension.programs = {
        joplin.enable = true;
      };
    })
  ];
}
