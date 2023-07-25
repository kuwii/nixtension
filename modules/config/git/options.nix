{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.config.git = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable git.";
    };

    lfs = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable git-lfs.";
      };
    };

    delta = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to enable the delta syntax highlighter. See https://github.com/dandavison/delta.";
      };
    };
  };
}
