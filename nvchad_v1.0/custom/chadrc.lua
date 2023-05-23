-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

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

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
