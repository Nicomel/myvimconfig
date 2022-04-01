require('telescope').load_extension('dap')
require('dbg.python')

local utils = require('utils')

utils.map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>')
utils.map('n', '<leader>dv', '<cmd>lua require"dap".step_over()<CR>')
utils.map('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>')
utils.map('n', '<leader>do', '<cmd>lua require"dap".step_out()<CR>')
utils.map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')

utils.map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
utils.map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
utils.map('v', '<leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

utils.map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
utils.map('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

utils.map('n', '<leader>dbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
utils.map('n', '<leader>dbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
utils.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')


-- telescope-dap
utils.map('n', '<leader>dtc',
          '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
utils.map('n', '<leader>dto',
          '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
utils.map('n', '<leader>dtl',
          '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
utils.map('n', '<leader>dtv',
          '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
utils.map('n', '<leader>dtf',
          '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

-- nvim-dap-ui
require("dapui").setup()
utils.map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')