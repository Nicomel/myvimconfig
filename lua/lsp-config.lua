local border = {
  {'╭',"FloatBorder"},
  {'─',"FloatBorder"},
  {'╮',"FloatBorder"},
  {'│',"FloatBorder"},
  {'╯',"FloatBorder"},
  {'─',"FloatBorder"},
  {'╰',"FloatBorder"},
  {'│',"FloatBorder"},
}

local function lspSymbol(name, icon)
vim.fn.sign_define(
	'DiagnosticSign' .. name,
	{ text = icon, texthl = 'Diagnostic' .. name, numhl = 'Diagnostic' .. name }
)
end

require'nvim-tree'.setup()

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
}

require("bufferline").setup{}

vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    -- show_end_of_line = true,
}

-- Completion compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = border,
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}


require("trouble").setup{}

--------------- LSP -------------------
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  -- Floating window styling
  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(
      vim.lsp.handlers.hover, { border = border }
    )

  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(
      vim.lsp.handlers.signature_help, { border = border }
    )

	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  lspSymbol("Error", "")
  lspSymbol("Warn", "")
  lspSymbol("Hint", "")
  lspSymbol("Info", "")
  lspSymbol("Other", "﫠")

	-- Mappings.
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({float = {border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}} })<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({float = {border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}} })<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({float = {border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}} })<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			hi LspReferenceRead cterm=bold ctermbg=red guibg=#4B5263 gui=bold
			hi LspReferenceText cterm=bold ctermbg=red guibg=#4B5263 gui=bold
			hi LspReferenceWrite cterm=bold ctermbg=red guibg=#4B5263 gui=bold
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
	end
end

-- From compe to use LSP snippet
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Python LSP setup
nvim_lsp.pyright.setup({
  on_attach=on_attach,
  capabilities = capabilities
})

-- Rust LSP setup
nvim_lsp.rust_analyzer.setup({
  on_attach=on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        disabled = {"unresolved-macro-call"},
        enableExperimental = true,
      },
    }
  }
})

-- Typescript LSP setup
nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end,
    capabilities = capabilities
}

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
}
local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint",
        rootPatterns = {".eslintrc.yml", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}
local formatters = {
    prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}
local formatFiletypes = {
    typescript = "prettier",
    typescriptreact = "prettier"
}
nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
        filetypes = filetypes,
        linters = linters,
        formatters = formatters,
        formatFiletypes = formatFiletypes
    }
}

require('lspfuzzy').setup {}

-- vim.lsp.set_log_level("debug")

local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/miniconda3/envs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

-------------- Tree-sitter -----------------
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed = "maintained",
  ensure_installed = {"bash", "c", "cmake", "cpp", "css", "scss", "dockerfile", "go", "json", "jsdoc", "lua", "make", "ocaml", "ocaml_interface", "r", "rust", "regex", "python", "javascript", "typescript", "tsx", "toml", "vim", "vue", "yaml"},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-------------- Unit vim ultests -------------
require("ultest").setup({
  builders = {
    ['python#pytest'] = function (cmd)
        -- The command can start with python command directly or an env manager
        local non_modules = {'python', 'pipenv', 'poetry'}
        -- Index of the python module to run the test.
        -- local module
        local module_index
        if vim.tbl_contains(non_modules, cmd[1]) then
          -- module = cmd[3]
          module_index = 3
        else
          -- module = cmd[1]
          module_index = 1
        end
        -- Remaining elements are arguments to the module
        local args = vim.list_slice(cmd, module_index + 1)
        return {
          dap = {
            type = 'python',
            name = 'TSA debugger',
            request = 'launch',
            -- module = module,
            module = cmd[module_index],
            args = args,
            python = function()
              -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
              -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
              -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
              local venv_python = os.getenv("CONDA_PREFIX")
              local cwd = vim.fn.getcwd()
              return venv_python .. '/bin/python'
            end,
            justMycode = false
          }
        }
      end
  }
})

