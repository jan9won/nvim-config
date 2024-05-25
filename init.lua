---------- nvim-tree ----------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- color encoding
vim.opt.termguicolors = true



require('jan9won')

--- Reload the entire configuration
function ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match('^jan9won') then
      package.loaded[name] = nil
    end
  end

  require('jan9won')

  -- Reload after/ directory
  local glob = vim.fn.stdpath('config') .. '/after/**/*.lua'
  local after_lua_filepaths = vim.fn.glob(glob, true, true)

  for _, filepath in ipairs(after_lua_filepaths) do
    dofile(filepath)
  end

  print("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('ReloadConfig', ReloadConfig, {})
