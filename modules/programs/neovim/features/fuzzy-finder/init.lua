local builtin = require('telescope.builtin')
vim.keymap.set('n', '__FILES__', builtin.find_files, {})
vim.keymap.set('n', '__LIVE_GREP__', builtin.live_grep, {})
vim.keymap.set('n', '__BUFFERS__', builtin.buffers, {})
vim.keymap.set('n', '__HELP_TAGS__', builtin.help_tags, {})
require('telescope').load_extension('fzf')
