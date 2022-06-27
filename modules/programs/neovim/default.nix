{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixtension.programs.neovim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Install Neovim with recommended plugins.";
    };

    enable-nix = mkOption {
      type = types.bool;
      default = true;
      description = "Install plugins that provide Nix support.";
    };

    plugins = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Plugins to install.";
    };
  };

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
      };

      environment.systemPackages = with pkgs; [
        xclip wl-clipboard
      ];
    })

    (mkIf (cfg.enable-nix) (import ./features/nix { inherit pkgs; }))
  ];
}
