local Terminal  = require('toggleterm.terminal').Terminal
local basic_terminal = Terminal:new({ hidden = true, direction = 'float' })
local bottom_terminal = Terminal:new({ hidden = true, direction = 'horizontal' })
local right_terminal = Terminal:new({ hidden = true, direction = 'vertical', size = 48 })
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

function _lazygit_toggle()
  lazygit:toggle()
end

function _terminal_toggle()
	basic_terminal:toggle()
end

function _terminal_toggle_bottom()
	bottom_terminal:toggle()
end

function _terminal_toggle_right()
	right_terminal:toggle()
end

vim.keymap.set('n', '<C-g>', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>', '<cmd>lua _terminal_toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>b', '<cmd>lua _terminal_toggle_bottom()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>r', '<cmd>lua _terminal_toggle_right()<CR>', { noremap = true, silent = true })
