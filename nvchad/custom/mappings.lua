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
