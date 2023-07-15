{ plugins ? [], init-vim ? "", init-lua ? "" }:

{
  nixtension.programs.neovim.plugins = plugins;
  nixtension.programs.neovim.init-vim = init-vim;
  nixtension.programs.neovim.init-lua = init-lua;
}
