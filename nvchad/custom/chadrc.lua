-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  hl_override = {
    Comment = { italic = true },
  },
  theme = "tokyonight",
  -- theme = "gruvchad",
}

local pluginConfs = require "custom.plugins.configs"

M.plugins = {
   user = require "custom.plugins"
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
   },
}

M.mappings = require "custom.mappings"

return M
