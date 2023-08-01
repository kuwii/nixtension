vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '__GOTO_DECLARATION__', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '__GOTO_DEFINITION__', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '__GOTO_IMPL__', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '__HOVER__', vim.lsp.buf.hover, opts)
  end,
})
