local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/miniconda3/envs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

