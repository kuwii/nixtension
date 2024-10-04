require("trouble").setup()

-- toggle diagnostics
vim.keymap.set("n", "__TOGGLE__",
  "<cmd>Trouble diagnostics toggle<cr>",
  {silent = true, noremap = true}
)
-- refresh
vim.keymap.set("n", "__REFRESH__",
  "<cmd>Trouble refresh<cr>",
  {silent = true, noremap = true}
)
