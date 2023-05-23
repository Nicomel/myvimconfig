---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<Tab>"] = "",
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<Esc>"] = ""
  }
}

M.general = {
--  n = {
--    [";"] = { ":", "enter command mode", opts = { nowait = true } },
--  },
  n = {
    ["<Esc>"] = { "<esc>", "Escape" },
    ["<C-q>"] = { "<cmd> q <CR>", "Quit neovim"},
    ["<leader>h"] = { "<C-w>s<C-w>l", "new horizontal split" }, -- lets override nvimtree's mappings
    ["<leader>v"] = { "<C-w>v<C-w>l", "new vertical split" }, -- lets override nvimtree's mappings
    ["<leader>o"] = { "<cmd> only<CR>", "Close split and keep current buffer" },
    ["<leader>xq"] = { "<cmd> cclose<CR>", "To close a quick fix list" },
    ["<leader>;"] = { "<cmd> tab split<CR>", "Create new tab from the current buffer" },
    ["<leader>:"] = { "<cmd> tabc<CR>", "Close tab" },
    ["<leader>w"] = { "<cmd> bprevious<cr>:bdelete #<cr>", "Close current buffer and go back to the previous one" },
  },

  i = {
    ["<Esc>"] = { "<esc>", "exit insert mode" }
  }
}

-- more keybinds!

M.fugitive = {
  n = {
    ["<leader>gs"] = { "<cmd> Git<CR>", "" },
    ["<leader>gc"] = { "<cmd> Git commit -v -q<CR>", "" },
    ["<leader>ga"] = { "<cmd> Git commit --amend<CR>", "" },
    ["<leader>gt"] = { "<cmd> Git commit -v -q %<CR>", "" },
    ["<leader>gd"] = { "<cmd> Gvdiffsplit!<CR>", "" },
    ["<leader>ge"] = { "<cmd> Gedit<CR>", "" },
    ["<leader>gr"] = { "<cmd> Gread<CR>", "" },
    ["<leader>gw"] = { "<cmd> Gwrite<CR>", "" },
    ["<leader>gl"] = { "<cmd> Gclog<CR>", "" },
    ["<leader>g0"] = { "<cmd> 0Gclog<CR>", "" },
    ["<leader>gp"] = { "<cmd> Ggrep<Space>", "" },
    ["<leader>gm"] = { "<cmd> GMove<Space>", "" },
    ["<leader>gb"] = { "<cmd> Git branch<Space>", "" },
    ["<leader>go"] = { "<cmd> Git checkout<Space>", "" },
    ["<leader>gx"] = { "<cmd> only<CR>", "" },
    ["<leader>g2"] = { "<cmd> diffget //2<Space>", "" },
    ["<leader>g3"] = { "<cmd> diffget //3<Space>", "" },
  }
}

M.gitsigns = {
  n = {
    ["]c"] = {
      function()
        require('gitsigns').next_hunk()
      end,
      "Next hunk"
    },
    ["[c"] = {
      function()
        require('gitsigns').prev_hunk()
      end,
      "Prev hunk"
    },
    ["<leader>hs"] = {
      function()
        require('gitsigns').stage_hunk()
      end,
      "Stage hunk"
    },
    ["<leader>hr"] = {
      function()
        require('gitsigns').reset_hunk()
      end,
      "Reset hunk"
    },
    ["<leader>hu"] = {
      function()
        require('gitsigns').undo_stage_hunk()
      end,
      "Undo stage hunk"
    },
    ["<leader>hR"] = {
      function()
        require('gitsigns').reset_buffer()
      end,
      "Reset buffer"
    },
    ["<leader>hp"] = {
      function()
        require('gitsigns').preview_hunk()
      end,
      "Preview hunk"
    },
    ["<leader>hb"] = {
      function()
        require('gitsigns').blame_line{full=true}
      end,
      "Blame line"
    },
    ["<leader>tb"] = {
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      "Toggle current line blame"
    },
    ["<leader>hd"] = {
      function()
        require('gitsigns').diffthis()
      end,
      "Diff this"
    },
    ["<leader>hD"] = {
      function()
        require('gitsigns').diffthis('~')
      end,
      "Diff this ~"
    },
    ["<leader>td"] = {
      function()
        require('gitsigns').toggle_deleted()
      end,
      "Toggle deleted"
    },
  },

  v = {
    ["<leader>hs"] = {
      function()
        require('gitsigns').stage_hunk()
      end,
      "Stage hunk"
    },
    ["<leader>hr"] = {
      function()
        require('gitsigns').prev_hunk()
      end,
      "Prev hunk"
    },
  },

  o = {
    ["ih"] = {"<cmd> <C-U>Gitsigns select_hunk<CR>", ""},
  },

  x = {
    ["ih"] = {"<cmd> <C-U>Gitsigns select_hunk<CR>", ""},
  }
}

return M
