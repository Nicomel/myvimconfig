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
      "http",
      "json",
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

M.nvimtree = {
   git = {
      enable = true,
   },
   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
}

return M
