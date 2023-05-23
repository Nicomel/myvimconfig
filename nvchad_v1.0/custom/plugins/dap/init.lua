local M = {}

local colors = require("base46").get_theme_tb "base_30"

local function configure()
  vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
  vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
  vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
  vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
  end

local function configure_exts()
  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local function configure_debuggers()
  require("custom.plugins.dap.python").setup()
  -- require("config.dap.rust").setup()
  -- require("config.dap.typescript").setup()
end

function M.setup()
  configure() -- Configuration
  configure_exts() -- Extensions
  configure_debuggers() -- Debugger
  -- require("custom.plugins.dap.keymaps").setup() -- Keymaps
end

configure_debuggers()

return M
