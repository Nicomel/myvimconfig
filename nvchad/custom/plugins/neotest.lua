local M = {}

function M.setup()
  local venv_python = os.getenv("HOME")
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
        runner = "pytest",
        python = venv_python .. '/miniconda3/envs/debugpy/bin/python',
      },
      require "neotest-plenary",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua" },
      },
    },
  }
end

return M
