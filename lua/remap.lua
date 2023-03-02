local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-b>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-s>', builtin.live_grep, {})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

