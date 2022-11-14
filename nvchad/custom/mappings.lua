-- lua/custom/mappings 
local M = {}

M.disabled = {
  n = {
    ["<Tab>"] = "",
    ["<TAB>"] = "",
    ["<S-Tab>"] = ""
  }
}
M.general = {
  n = {
    ["<C-q>"] = { "<cmd> q <CR>", "Quit neovim"},
    ["<leader>h"] = { "<C-w>s<C-w>l", "new horizontal split" }, -- lets override nvimtree's mappings
    ["<leader>v"] = { "<C-w>v<C-w>l", "new vertical split" }, -- lets override nvimtree's mappings
    ["<leader>o"] = { "<cmd> only<CR>", "Close split and keep current buffer" },
    ["<leader>xq"] = { "<cmd> cclose<CR>", "To close a quick fix list" },
    ["<leader>;"] = { "<cmd> tab split<CR>", "Creat new tab from the current buffer" },
    ["<leader>:"] = { "<cmd> tabc<CR>", "Close tab" },
    ["<leader>w"] = { "<cmd> bprevious<cr>:bdelete #<cr>", "Close current buffer and go back to the previous one" },
  }
}

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

M.neotest =  {
  n = {
    ["<leader>tn"] = {
      function()
        require('neotest').run.run()
      end,
      "Run nearest"
    },
    ["<leader>tN"] = {
      function()
        require('neotest').run.run({strategy = 'dap'})
      end,
      "Debug nearest"
    },
    ["<leader>tf"] = {
      function()
        require('neotest').run.run(vim.fn.expand("%"))
      end,
      "Run file"
    },
    ["<leader>ta"] = {
      function()
        require('neotest').run.attach()
      end,
      "Attach"
    },
    ["<leader>tF"] = {
      function()
        require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})
      end,
      "Debug file"
    },
    ["<leader>tl"] = {
      function()
        require('neotest').run.run_last()
      end,
      "Run last"
    },
    ["<leader>tL"] = {
      function()
            require('neotest').run.run_last({ strategy = 'dap' })
      end,
      "Debug last"
    },
    ["<leader>to"] = {
          function()
            require('neotest').output.open({ enter = true })
              end,
      "Output"
    },
    ["<leader>tS"] = {
          function()
            require('neotest').run.stop()
              end,
      "Stop"
    },
    ["<leader>ts"] = {
          function()
            require('neotest').summary.toggle()
              end,
      "Summary"
    },
  }
}

M.dap = {
 n = {
    ["<leader>dR"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    ["<leader>dE"] = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    ["<leader>dC"] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    ["<leader>dk"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>de"] = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>dh"] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    ["<leader>dS"] = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    ["<leader>dx"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },

  v = {
    ["<leader>de"] = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
  }
}

M.rest = {
  n = {
    ["<leader>j"] = {
      function()
        require('rest-nvim').run()
      end,
      "Run REST request"
    },
  }
}

return M
