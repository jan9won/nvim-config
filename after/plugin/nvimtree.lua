-- Manual
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

-- key mapping
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')
  -- OR use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- key reset
  vim.keymap.del('n', 's', { buffer = bufnr })

  -- open folder
  vim.keymap.set('n', 's]', api.tree.change_root_to_node, { noremap = true, buffer = bufnr })
  vim.keymap.set('n', 's[', api.tree.change_root_to_parent, { noremap = true, buffer = bufnr })

  -- file opening
  vim.keymap.set('n', 'sv', api.node.open.vertical, { noremap = true, buffer = bufnr })
  vim.keymap.set('n', 'ss', api.node.open.horizontal, { noremap = true, buffer = bufnr })
  vim.keymap.set('n', 'st', api.node.open.tab, { noremap = true, buffer = bufnr })
  vim.keymap.set('n', 'so', api.node.run.system, { noremap = true, buffer = bufnr })

  -- pane actions
  -- vim.keymap.set("n", "spp", ":NvimTreeOpen<Return>")
  vim.keymap.set("n", "spe", ":NvimTreeToggle<Return>")
  -- vim.keymap.set("n", "spc", ":NvimTreeClose<Return>")
  vim.keymap.set("n", "spl", ":NvimTreeFindFile<Return>")
  -- vim.keymap.set("n", "fpc", ":NvimTreeCollapse<Return>")
end

-- Main Config
require("nvim-tree").setup({
  on_attach = my_on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  sort = {
    sorter = "case_sensitive"
  },
  view = {
    width = 30,
    side = "left",
    number = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = false,
    indent_width = 2,
    indent_markers = {
      enable = true
    }
  },
  git = {
    enable = true,
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
    git_clean = false,
    custom = {
      '\\.DS_Store',
      '\\.Ulysses-Group.plist',
      '\\.Ulysses-Settings.plist',
      '\\._.*' -- this is for mounted volumes
    },
    exclude = {}
  },
})

require 'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  },
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "CustomGitIgnore"
    },
    [".prettierignore"] = {
      icon = "󰫽",
      color = "#9c2903",
      name = "CustomPrettierIgnore",
    },
    [".prettierrc"] = {
      icon = "󰫽",
      color = "#9c2903",
      name = "CustomPrettierRc",
    },
  },
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log"
    }
  },
}

require("nvim-web-devicons").refresh()
