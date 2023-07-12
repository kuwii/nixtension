{ plugins ? [], vimrc ? "", initLua ? "" }:

{
  nixtension.programs.neovim.plugins = plugins;
  nixtension.programs.neovim.vimrc = "lua << EOF\n" + initLua + "\nEOF\n" + vimrc;
}
