local M = {}

function M.setup ()
  -- Enable telescope fzf native
  require("telescope").load_extension "fzf"
  -- Enable telescope file browser
  require("telescope").load_extension "file_browser"

  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ['<C-d>'] = "delete_buffer",
          }
        }
      }
    },
  }
end

return M
