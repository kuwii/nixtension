{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  imports = [
    ./config.nix
  ];

  config = mkMerge [
    (mkIf cfg.enable {
      programs.neovim.enable = true;

      programs.neovim.defaultEditor = true;

      programs.neovim.viAlias = true;
      programs.neovim.vimAlias = true;

      programs.neovim.withPython3 = true;
      programs.neovim.withNodeJs = true;
      programs.neovim.withRuby = true;

      programs.neovim.configure = {
        packages.myVimPackage = {
          start = cfg.plugins;
        };
        customRC = cfg.vimrc;
      };

      environment.systemPackages = with pkgs; [
        xclip wl-clipboard
      ];
    })

    (mkIf (cfg.enable && cfg.basic-settings.enable) (import ./features/basic-settings { }))
    (mkIf (cfg.enable && cfg.explorer.enable) (import ./features/explorer { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.nix-support.enable) (import ./features/nix { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.status-bar.enable) (import ./features/status-bar { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.current-word.enable) (import ./features/current-word { inherit pkgs; }))
    (mkIf (cfg.enable && cfg.terminal.enable) (import ./features/terminal { inherit pkgs; }))
  ];
}
