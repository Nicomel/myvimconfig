local M = {}

local function config_test()
  vim.api.nvim_exec(
    [[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1
        " Python
        let test#python#runner = 'pytest'
    ]],
    false
  )
end

function M.setup()
  local venv_python = os.getenv("CONDA_PREFIX")
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
        runner = "pytest",
        python = venv_python .. '/bin/python',
      },
      require "neotest-plenary",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua" },
      },
    },
    -- overseer.nvim
    -- consumers = {
    --   overseer = require "neotest.consumers.overseer",
    -- },
    -- overseer = {
    --   enabled = true,
    --   force_default = true,
    -- },
    icons = {
      passed = "",
      running = "",
      failed = "",
      skipped = "",
      unknown = "?",
    }
  }

  -- vim-test
  config_test()
end

return M
