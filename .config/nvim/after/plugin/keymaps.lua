local g = vim.g
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Remap leader and local leader to <Space>
keymap("", "<Space>", "<Nop>", default_opts)
g.mapleader = " "
g.maplocalleader = " "

-- Close current buffer without closing window
keymap('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', default_opts)

-- Diagnostic Shortcuts 
keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default_opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', default_opts)
keymap('n', '<leader>l', '<cmd>lua vim.diagnostic.setloclist()<CR>', default_opts)

-- Telescope Shortcuts
keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], default_opts)
keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], default_opts)
keymap('n', '<leader>se', [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>]], { noremap = true })
keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], default_opts)
keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], default_opts)
keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], default_opts)
keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], default_opts)
keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], default_opts)
keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], default_opts)
keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], default_opts)

