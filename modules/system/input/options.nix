{ lib, ... }:

let
  inherit (lib) mkOption types;
in
{
  options.nixtension.system.input = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Setup input method based on Fcitx 5.";
    };

    chinese.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Chinese input method.";
    };

    japanese.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Japanese input method.";
    };
  };
}
