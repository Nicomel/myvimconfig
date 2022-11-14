-- custom/plugins/init.lua has to return a table
-- The plugin name is github user or organization name/reponame

local overrides = require "custom.plugins.overrides"

return {
  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  -- override plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  ["tpope/vim-fugitive"] = {},
  ["tpope/vim-unimpaired"] = {},
  ["tpope/vim-abolish"] = {},
  ["tpope/vim-surround"] = {},
  ["vim-test/vim-test"] = {},
  ["mfussenegger/nvim-dap"] = {
    opt = true,
    keys = { [[<leader>d]] },
    module = {"dap"},
    wants = { "nvim-dap-ui", "nvim-dap-python" },
    requires = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      require("custom.plugins.dap").setup()
    end,
    disable = false,
  },
  ["nvim-neotest/neotest"] = {
    opt = true,
    wants = {
      "plenary.nvim",
      "nvim-treesitter",
      "FixCursorHold.nvim",
      "neotest-python",
      "neotest-plenary",
      "neotest-vim-test",
      "vim-test",
      -- "overseer.nvim",
    },
    requires = {
      "vim-test/vim-test",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
    module = { "neotest", "neotest.async" },
    cmd = {
      "TestNearest",
      "TestFile",
      "TestSuite",
      "TestLast",
      "TestVisit",
    },
    config = function()
      require("custom.plugins.neotest").setup()
    end,
    disable = false,
  },
  ["NTBBloodbath/rest.nvim"] = {
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("custom.plugins.rest").setup()
    end,
  },
  ["iamcco/markdown-preview.nvim"] = {
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  }
}
