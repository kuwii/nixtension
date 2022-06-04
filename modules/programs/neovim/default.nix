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
  };

  config = (mkIf cfg.enable {
    programs.neovim.enable = true;

    programs.neovim.defaultEditor = true;

    programs.neovim.viAlias = true;
    programs.neovim.vimAlias = true;

    programs.neovim.withPython3 = true;
    programs.neovim.withNodeJs = true;
    programs.neovim.withRuby = true;

    programs.neovim.configure = {
      packages.myVimPackage = import ./plugins.nix { inherit pkgs; };
    };

    environment.systemPackages = with pkgs; [
      xclip wl-clipboard
    ];
  });
}
