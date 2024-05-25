-- https://github.com/nfrid/markdown-togglecheck
require('markdown-togglecheck').setup({
  -- create empty checkbox on item without any while toggling
  create = true,
  -- remove checked checkbox instead of unckecking it while toggling
  remove = false,
})

local function toggle()
  vim.go.operatorfunc = "v:lua.require'markdown-togglecheck'.toggle"
  return 'g@l'
end

vim.keymap.set('n', 'tt', toggle, { expr = true, desc = 'Toggle Checkmark' })
