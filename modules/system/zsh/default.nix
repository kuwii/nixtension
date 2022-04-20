{ config, lib, pkgs, ... }:

let
  cfg = config.nixt.system.zsh;
  inherit (lib) mkIf mkMerge mkOption types;
in
{
  options.nixt.system.zsh = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Nixt Zsh support, including Zsh, Oh My Zsh and some useful plugins and settings.";
    };
  };

  config = (mkIf cfg.enable {
    programs.zsh.enable = true;
    programs.zsh.ohMyZsh.enable = true;
    programs.zsh.ohMyZsh.plugins = [
      "man" "git" "rsync"
      "zsh-interactive-cd"
    ];
    programs.zsh.ohMyZsh.theme = "ys";

    users.defaultUserShell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
      fzf
    ];
  });
}
