-- tokyonight config
require("tokyonight").setup({
  transparent = true,
  styles = {
    comments = {
      fg = "gray",
    },
    sidebars = "dark",
    floats = "dark"
  },
  -- dim_inactive = true
  sidebars = { "nvimtree" }
});

-- lsp color config
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
});

function SetColor(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColor()

