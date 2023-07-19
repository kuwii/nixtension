require("toggleterm").setup {
  open_mapping = [[__TOGGLE__]],
  insert_mappings = true,
  close_on_exit = true,
  direction = "__direction__",
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '__UNFOCUS__', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
