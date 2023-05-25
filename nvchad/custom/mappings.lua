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
    ["<leader>gs"] = { "<cmd> Git<CR>", "git status" },
    ["<leader>gc"] = { "<cmd> Git commit -v -q<CR>", "git commit verbose and quiet if successful" },
    ["<leader>ga"] = { "<cmd> Git commit --amend<CR>", "Amend previous commit" },
    ["<leader>gt"] = { "<cmd> Git commit -v -q %<CR>", "Commit the current file" },
    ["<leader>gd"] = { "<cmd> Gvdiffsplit!<CR>", "Vertical diff split of the current file" },
    ["<leader>ge"] = { "<cmd> Gedit<CR>", ":edit a fugitive object" },
    ["<leader>gr"] = { "<cmd> Gread<CR>", "Empty the buffer and :read a fugitive object" },
    ["<leader>gw"] = { "<cmd> Gwrite<CR>", "Write to the current file's path and stage the results" },
    ["<leader>gl"] = { "<cmd> Gclog<CR>", "Load commit history into the quick fix list" },
    ["<leader>g0"] = { "<cmd> 0Gclog<CR>", "Commit history of the current file into the quick fix list" },
    ["<leader>gp"] = { "<cmd> Ggrep<Space>", "Grep" },
    ["<leader>gm"] = { "<cmd> GMove<Space>", "Move" },
    ["<leader>gb"] = { "<cmd> Git branch<Space>", "git branch" },
    ["<leader>go"] = { "<cmd> Git checkout<Space>", "git checkout" },
    ["<leader>gx"] = { "<cmd> only<CR>", "Keep only the current selected pane opened" },
    ["<leader>g2"] = { "<cmd> diffget //2<Space>", "fetches the hunk from the target parent (on the left)" },
    ["<leader>g3"] = { "<cmd> diffget //3<Space>", "fetches the hunk from the merge parent (on the right)" },
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
