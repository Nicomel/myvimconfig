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
