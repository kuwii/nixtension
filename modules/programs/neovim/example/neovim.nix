{ config, lib, pkgs, ... }:

{
  # Enable Neovim
  nixtension.programs.neovim.enable = true;

  # Some recommended basic settings
  nixtension.programs.neovim.basic-settings.enable = true;

  # Status bar feature
  nixtension.programs.neovim.status-bar.enable = true;

  # File explorer feature
  nixtension.programs.neovim.explorer.enable = true;
  nixtension.programs.neovim.explorer.keymap = {
    toggle = "<space>e";
  };

  # Git feature
  nixtension.programs.neovim.git.enable = true;
  nixtension.programs.neovim.git.keymap = {
    toggle = "<space>gg";
    toggle-number = "<space>gn";
    toggle-line = "<space>gl";
    toggle-word = "<space>gw";
    toggle-blame = "<space>gb";
    toggle-delete = "<space>gd";
    hunk-preview = "<space>gp";
    hunk-inline = "<space>gi";
    hunk-previous = "<space>gk";
    hunk-next = "<space>gj";
    diff = "<space>gc";
  };

  # Fuzzy finder feature
  nixtension.programs.neovim.fuzzy-finder.enable = true;
  nixtension.programs.neovim.fuzzy-finder.keymap = {
    files = "<space>fg";
    live-grep = "<space>fg";
    buffers = "<space>fb";
    help-tags = "<space>fh";
  };

  # Terminal feature
  nixtension.programs.neovim.terminal.enable = true;
  nixtension.programs.neovim.terminal.direction = "horizontal";
  nixtension.programs.neovim.terminal.keymap = {
    toggle = "<c-\\>";
    unfocus = "<c-t>";
  };

  # Current word feature
  nixtension.programs.neovim.current-word.enable = true;
  nixtension.programs.neovim.current-word.keymap = {
    toggle = "<space>w";
  };

  # Markdown feature
  nixtension.programs.neovim.markdown.enable = true;
  nixtension.programs.neovim.markdown.keymap = {
    toggle = "<space>p";
  };

  # LSP feature
  nixtension.programs.neovim.nvim-lspconfig.enable = true;
  nixtension.programs.neovim.lua-support.enable = true;
  nixtension.programs.neovim.nix-support.enable = true;
  nixtension.programs.neovim.bash-support.enable = true;

  # Add any other plugins & configurations here
  nixtension.programs.neovim.plugins = with pkgs.vimPlugins; [
    # block-nvim
  ];
  nixtension.programs.neovim.init-vim = ""; # Can use builtins.readFile /path/to/init.vim;
  nixtension.programs.neovim.init-lua = ""; # Can use builtins.readFile /path/to/init.lua;
}
