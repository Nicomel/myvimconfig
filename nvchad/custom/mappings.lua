-- lua/custom/mappings 
local M = {}

M.globalmaps = {
  n = {
    ["<C-q>"] = { "<cmd> q <CR>", "Quit neovim"},
    ["<leader>h"] = { "<C-w>s<C-w>l", "new horizontal split" }, -- lets override nvimtree's mappings
    ["<leader>v"] = { "<C-w>v<C-w>l", "new vertical split" }, -- lets override nvimtree's mappings
    ["<leader>o"] = { "<cmd> only<CR>", "Close split and keep current buffer" },
    ["<leader>xq"] = { "<cmd> cclose", "To close a quick fix list" },
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

M.dap = {
  n = {
    ["<leader>dc"] = { '<cmd>lua require"dap".continue()<CR>', "" },
    ["<leader>dv"] = { '<cmd>lua require"dap".step_over()<CR>', "" },
    ["<leader>di"] = { '<cmd>lua require"dap".step_into()<CR>', "" },
    ["<leader>do"] = { '<cmd>lua require"dap".step_out()<CR>', "" },
    ["<leader>db"] = { '<cmd>lua require"dap".toggle_breakpoint()<CR>', "" },
    ["<leader>dsc"] = { '<cmd>lua require"dap.ui.variables".scopes()<CR>', "" },
    ["<leader>dhh"] = { '<cmd>lua require"dap.ui.variables".hover()<CR>', "" },
    ["<leader>dhv"] = { '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', "" },
    ["<leader>duh"] = { '<cmd>lua require"dap.ui.widgets".hover()<CR>', "" },
    ["<leader>duf"] = { "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", "" },
    ["<leader>dbr"] = { '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "" },
    ["<leader>dbm"] = { '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', "" },
    ["<leader>dro"] = { '<cmd>lua require"dap".repl.open()<CR>', "" },
    ["<leader>drl"] = { '<cmd>lua require"dap".repl.run_last()<CR>', "" },
    -- telescope-dap
    ["<leader>dtc"] = { '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', "" },
    ["<leader>dto"] = { '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', "" },
    ["<leader>dtl"] = { '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "" },
    ["<leader>dtv"] = { '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', "" },
    ["<leader>dtf"] = { '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', "" },
    -- nvim-dap-ui
    ["<leader>dui"] = { '<cmd>lua require"dapui".toggle()<CR>', "" },
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

return M
