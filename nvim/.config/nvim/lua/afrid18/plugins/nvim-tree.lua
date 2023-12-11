return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 30,
        -- relativenumber = true,
      },
      -- Update focused file in Nvim-tree
      update_focused_file = {
        enable = true, -- Automatically update the focused file in nvim-tree when the file is changed
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = ">", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = {
          ".DS_Store",
          "node_modules",
        },
      },
      git = {
        ignore = false,
      },
    })

    mappings = {
      list = {
        {
          key = "<C-t>",
          action = "whatever",
          action_cb = function(node)
            vim.cmd("tabnew " .. vim.fn.fnameescape(node.absolute_path))
          end,
        },
      }
    }

    -- set keymaps
    local keymap = vim.keymap                                                                                                         -- for conciseness

    keymap.set("i", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })                              -- toggle file explorer
    keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })                              -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })                     -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })                       -- refresh file explorer
  end,
}
