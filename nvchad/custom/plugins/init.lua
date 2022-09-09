-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {
  ["tpope/vim-unimpaired"] = {},
  ["tpope/vim-fugitive"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["nvim-neotest/neotest-python"] = {},
  ["nvim-neotest/neotest-plenary"] = {},
  ["nvim-neotest/neotest-vim-test"] = {},
  ["nvim-neotest/neotest"] = {
    module = "neotest",
    opt = true,
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
}
