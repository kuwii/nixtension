{ plugins ? [], vimrc ? "" }:

{
  nixtension.programs.neovim.plugins = plugins;
  nixtension.programs.neovim.vimrc = vimrc;
}
