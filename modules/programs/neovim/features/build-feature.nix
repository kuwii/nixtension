{ plugins ? [], vimrc ? "" }:

{
  nixtension.programs.neovim.plugins = plugins;
}
