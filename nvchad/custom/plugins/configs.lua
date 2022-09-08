-- custom/plugins/configs.lua file

local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "html",
      "css",
      "python",
      "rust",
      "javascript",
      "typescript",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

M.mason = {
   ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "diagnostic-languageserver",
      "tailwindcss-language-server",
      "json-lsp",
      "prettier",

      -- python
      "black",
      "flake8",
      "pyright",
      "debugpy",

      -- rust
      "rust-analyzer",

      -- shell
      "shfmt",
      "shellcheck",
   },
}

-- you cant directly call a module in chadrc thats related to the default config 
-- Thats because most probably that module is lazyloaded
-- In this case its 'cmp', we have lazyloaded it by default
-- So you need to make this override field a function, instead of a table 
-- And the function needs to return a table!

M.cmp = function()
   local cmp = require 'cmp' 

   return {
      mapping = {
         ["<C-d>"] = cmp.mapping.scroll_docs(-8),
      }
    }
end

M.neotest = function()
  local present, neotest = pcall(require, "neotest")

  if not present then
    return
  end

  neotest.setup({
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
        runner = "pytest",
      },
      require "neotest-plenary",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua" },
      },
    },
  })
end

return M
