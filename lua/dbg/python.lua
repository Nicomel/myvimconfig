-- local venv_python = os.getenv("CONDA_PREFIX")
local venv_python = os.getenv("HOME")
require('dap-python').setup(venv_python .. '/miniconda3/envs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'
