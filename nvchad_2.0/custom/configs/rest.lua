local M = {}
function M.setup()
  require("rest-nvim").setup {
    result = {
      behavior = {
        decode_url = true,
        show_info = {
          -- url = true,
          -- headers = true,
          -- http_info = true,
          -- curl_command = true,
          url = false,
          headers = false,
          http_info = false,
          curl_command = false,
        },
      },
      keybinds = {
        buffer_local = true,
        prev = "H",
        next = "L",
      },
    },
    ---Example:
    ---
    ---```lua
    ---keybinds = {
    ---  {
    ---    "<localleader>rr", "<cmd>Rest run<cr>", "Run request under the cursor",
    ---  },
    ---  {
    ---    "<localleader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
    ---  },
    ---}
    ---
    ---```
    ---@see vim.keymap.set
    keybinds = {},
  }
end

return M
