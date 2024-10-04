{ config, lib, pkgs, ... }:

{
  # Enable Neovim
  # Belows are default configurations and can be used as a template.
  nixtension.programs.neovim.enable = true;

  # Some recommended basic settings
  nixtension.programs.neovim.basic-settings.enable = true;

  # Scrollbar feature
  # Based on nvim-scrollbar
  nixtension.programs.neovim.scrollbar.enable = true;

  # Status bar feature
  # Based on vim-airline & vim-airline-clock
  nixtension.programs.neovim.status-bar.enable = true;

  # File explorer feature
  # Based on nvim-tree.lua & nvim-web-devicons
  nixtension.programs.neovim.explorer.enable = true;
  nixtension.programs.neovim.explorer.keymap = {
    toggle = "<space>e";
    focus = "<space>E";
  };

  # Git feature
  # Based on gitsigns.nvim
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
  # Based on telescope.nvim & telescope-zf-native.nvim & plenary.nvim
  nixtension.programs.neovim.fuzzy-finder.enable = true;
  nixtension.programs.neovim.fuzzy-finder.keymap = {
    files = "<space>fg";
    live-grep = "<space>fg";
    buffers = "<space>fb";
    help-tags = "<space>fh";
  };

  # Terminal feature
  # Based on toggleterm.nvim
  nixtension.programs.neovim.terminal.enable = true;
  nixtension.programs.neovim.terminal.direction = "horizontal";
  nixtension.programs.neovim.terminal.keymap = {
    toggle = "<c-\\>";
    unfocus = "<c-t>";
  };

  # Current word feature
  # Based on vim_current_word
  nixtension.programs.neovim.current-word.enable = true;
  nixtension.programs.neovim.current-word.keymap = {
    toggle = "<space>w";
  };

  # Markdown feature
  # Based on markdown-preview.nvim & vim-markdown
  nixtension.programs.neovim.markdown.enable = true;
  nixtension.programs.neovim.markdown.keymap = {
    toggle = "<space>p";
  };

  # LSP feature
  # Based on nvim-lspconfig
  nixtension.programs.neovim.nvim-lspconfig.enable = true;
  # Based on lua-language-server & LuaJIT
  nixtension.programs.neovim.lua-support.enable = true;
  # Based on rnix-lsp
  nixtension.programs.neovim.nix-support.enable = true;
  # Based on bash-language-server
  nixtension.programs.neovim.bash-support.enable = true;

  # Diagnostic feature
  # Based on Trouble & LSP Colors & nvim-web-devicons
  nixtension.programs.neovim.diagnostic.enable = true;
  nixtension.programs.neovim.diagnostic.keymap = {
    toggle = "<space>de";
    refresh = "<space>dR";
  };

  # Add any other plugins & configurations here
  nixtension.programs.neovim.plugins = with pkgs.vimPlugins; [
    # block-nvim
  ];
  nixtension.programs.neovim.init-vim = ""; # Can use builtins.readFile /path/to/init.vim;
  nixtension.programs.neovim.init-lua = ""; # Can use builtins.readFile /path/to/init.lua;
}
