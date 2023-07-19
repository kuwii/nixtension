{ config, lib, pkgs, ... }:

let
  cfg = config.nixtension.programs.neovim.fuzzy-finder;
  keymap = cfg.keymap;
  withConfig = builtins.replaceStrings [
    "__FILES__" "__LIVE_GREP__" "__BUFFERS__" "__HELP_TAGS__"
  ] [
    keymap.files keymap.live-grep keymap.buffers keymap.help-tags
  ];
in
lib.mkMerge [
  (import ../build-feature.nix {
    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
    ];
    init-lua = withConfig (builtins.readFile ./init.lua);
  })
  ({
    nixtension.config.packages = with pkgs; [
      ripgrep fd
    ];
  })
]
