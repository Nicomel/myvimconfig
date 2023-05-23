local M = {}

function M.setup(_)
  local venv_python = os.getenv("HOME")
  require('dap-python').setup(venv_python .. '/miniconda3/envs/debugpy/bin/python')
  require('dap-python').test_runner = 'pytest'
  table.insert(require("dap").configurations.python, {
    type = "python",
    request = "attach",
    connect = {
      port = 5678,
      host = "127.0.0.1",
    },
    mode = "remote",
    name = "Container Attach Debug",
    cwd = vim.fn.getcwd(),
    pathMappings = {
      {
        localRoot = function()
          return vim.fn.input("Local code folder > ", vim.fn.getcwd(), "file")
         -- Local folder the code lives
        end,
        remoteRoot = function()
          return vim.fn.input("Container code folder > ", "/", "file")
          -- "/fastapi", -- Wherever your Python code lives in the container.
        end,
      },
    },
  })
end

return M
