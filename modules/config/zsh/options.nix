{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.config.zsh = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable zsh.";
    };

    completion = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable zsh completion";
      };
    };

    vte-integration = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable Zsh integration for VTE terminals. This allows it to preserve the current directory of the shell across terminals.";
      };
    };

    autosuggestions = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable zsh-autosuggestions.";
      };
    };

    oh-my-zsh = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable oh-my-zsh.";
      };
    };
  };
}
