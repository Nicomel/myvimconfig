-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {
  ["tpope/vim-unimpaired"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["nvim-neotest/neotest"] = {
    module = "neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    },
  },
}
