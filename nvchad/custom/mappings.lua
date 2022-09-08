-- lua/custom/mappings 
local M = {}

M.globalmaps = {
  n = {
    ["<C-q>"] = { "<cmd> q <CR>", "Quit neovim"},
    ["<leader>h"] = { "<C-w>s<C-w>l", "new horizontal split" }, -- lets override nvimtree's mappings
    ["<leader>v"] = { "<C-w>v<C-w>l", "new vertical split" }, -- lets override nvimtree's mappings
  }
}

return M
