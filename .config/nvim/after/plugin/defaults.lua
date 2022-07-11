local api = vim.api
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd


opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true -- Set highlight on search
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Make relative number default
opt.mouse = "a" -- Enable mouse mode
opt.breakindent = true -- Enable break indent
opt.undofile = true -- Save undo history
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 -- Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.cmdheight = 2 -- Two row command bar
opt.timeoutlen = 300 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.scrolloff = 8 -- Lines of context
-- opt.scrolloff = 999 -- Lines of context
-- opt.sidescrolloff = 999
opt.joinspaces = false -- No double spaces with join after a dot
opt.sessionoptions = "buffers,curdir,help,tabpages,winsize,winpos,terminal"
opt.completeopt = "menuone,noselect"
opt.smartindent = true -- Smart indent
opt.expandtab = true
opt.smarttab = true
opt.textwidth = 0
opt.autoindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.laststatus = 3 -- Global statusline

cmd [[ colorscheme gruvbox-material ]]

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- Treesitter based folding
cmd [[
  set foldlevel=20
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]]
