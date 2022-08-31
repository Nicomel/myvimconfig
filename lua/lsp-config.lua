require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = true,
      },
    },
  },
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    indent_markers = { enable = true },
    highlight_git = true,
    highlight_opened_files = "icon",
    root_folder_modifier = ':~',
    add_trailing = true,
    icons = {
      padding = ' ',
      symlink_arrow = ' >> ',
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
    special_files = { 'README.md', 'Makefile', 'MAKEFILE', "Cargo.toml"},
  },
  filters = {
    dotfiles = true,
  },
  respect_buf_cwd = true,
  create_in_closed_folder = false,
})


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

require("trouble").setup{}

--------------- LSP -------------------

  -- Floating window styling
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

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local function lspSymbol(name, icon)
vim.fn.sign_define(
	'DiagnosticSign' .. name,
	{ text = icon, texthl = 'Diagnostic' .. name, numhl = 'Diagnostic' .. name }
)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Border override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  lspSymbol("Error", "")
  lspSymbol("Warn", "")
  lspSymbol("Hint", "")
  lspSymbol("Info", "")
  lspSymbol("Other", "﫠")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

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

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
nvim_lsp['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
nvim_lsp['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
nvim_lsp['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
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

