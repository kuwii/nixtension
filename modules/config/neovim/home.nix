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
      programs.neovim.vimdiffAlias = true;
    })
    ({
      programs.neovim.plugins = cfg.plugins;
      programs.neovim.extraConfig = cfg.vimrc;
    })
  ];
}
