-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {
  ["tpope/vim-unimpaired"] = {},
  ["tpope/vim-fugitive"] = {},
  ["vim-test/vim-test"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    module = "dap",
    opt = true,
    keys = { [[<leader>d]] },
    wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python" },
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      require("custom.plugins.dap").setup()
    end,
  },
  ["nvim-neotest/neotest"] = {
    module = "neotest",
    opt = true,
    wants = {
      "plenary.nvim",
      "nvim-treesitter",
      "FixCursorHold.nvim",
      "neotest-python",
      "neotest-plenary",
      "vim-test",
      "neotest-vim-test",
    },
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      -- require("custom.plugins.configs").neotest()
      require("custom.plugins.neotest").setup()
    end,
  },
  ["NTBBloodbath/rest.nvim"] = {
    module = "nvim-rest",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("custom.plugins.rest").setup()
    end,
  }
}
