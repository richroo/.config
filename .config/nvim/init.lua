-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require('packer').use
require('packer').startup(function()
  -- Package manager
  use { "wbthomason/packer.nvim" }

  -- Gruvbox Material Theme
  use { "sainnhe/gruvbox-material" }

  -- "gc" to comment visual regions/lines
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }

  -- Shared movement between nvim and tmux
  use {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        copy_sync = {
          -- enables copy sync and overwrites all register actions to
          -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
          enable = true,
        },
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        }
      })
    end
  }

  -- Smooth scrolling
  use {
    "declancm/cinnamon.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("cinnamon").setup()
    end
  }

  -- Fancier statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "gruvbox",
          component_separators = "|",
          section_separators = "",
        },
      }
    end
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end
  }

  -- Better diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }

  use { "p00f/nvim-ts-rainbow" }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter").setup()
    end,
    requires = {
      -- Additional textobjects for treesitter
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    }
  }

  -- Add indentation guides even on blank lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
    }
  }

  -- UI to select things (files, grep results, open buffers...)
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.telescope").setup()
    end
  }

  -- Collection of configurations for built-in LSP client
  -- Snippets plugin
  use { "L3MON4D3/LuaSnip" }
  use { "hrsh7th/nvim-cmp" } -- Autocompletion plugin
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path"}
  use { "saadparwaiz1/cmp_luasnip" }
  -- Auto pairs brackets and other symbols
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  }
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lspconfig").setup()
    end
  }
end)

