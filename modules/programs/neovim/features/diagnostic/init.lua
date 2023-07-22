vim.keymap.set("n", "__TOGGLE__",
  "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__REFRESH__",
  "<cmd>TroubleRefresh<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__OPEN_DOCUMENT__",
  "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__OPEN_WORKSPACE__",
  "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__OPEN_QUICKFIX__",
  "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__OPEN_LOCLIST__",
  "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__OPEN_REFERENCES__",
  "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__OPEN_DEFINITIONS__",
  "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "__OPEN_TYPE_DEFINITIONS__",
  "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
