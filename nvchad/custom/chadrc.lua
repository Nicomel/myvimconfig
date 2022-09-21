-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local pluginConfs = require "custom.plugins.configs"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  hl_add = {
    DapBreakpoint = { fg = "red", bg = "lightbg" },
    DapLogPoint = { fg = "blue", bg = "lightbg" },
    DapStopped = { fg = "green", bg = "lightbg" },
  },
  hl_override = {
    Comment = { italic = true },
  },
  theme = "tokyonight",
}

M.plugins = {
   user = require "custom.plugins",
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
      ["williamboman/mason.nvim"] = pluginConfs.mason,
   },
}

M.mappings = require "custom.mappings"

return M
