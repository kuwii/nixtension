{ config, lib, ... }:

let
  cfg = config.nixtension.config.neovim;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./config.nix ];

  config = mkMerge [
    (mkIf cfg.enable {
      programs.neovim.enable = true;
    })
    (mkIf cfg.defaultEditor {
      programs.neovim.defaultEditor = true;
    })
    (mkIf cfg.withPython3 {
      programs.neovim.withPython3 = true;
    })
    (mkIf cfg.withNodeJs {
      programs.neovim.withNodeJs = true;
    })
    (mkIf cfg.withRuby {
      programs.neovim.withRuby = true;
    })
    (mkIf cfg.alias {
      programs.neovim.viAlias = true;
      programs.neovim.vimAlias = true;
    })
    ({
      programs.neovim.configure = {
        packages.myVimPackage = {
          start = cfg.plugins;
        };
        customRC = cfg.vimrc;
      };
    })
  ];
}
