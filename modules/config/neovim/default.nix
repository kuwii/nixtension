{ config, lib, ... }:

let
  cfg = config.nixtension.config.neovim;
  inherit (lib) mkIf mkMerge;
in
{
  imports = [ ./config.nix ];

  config = mkMerge [
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
