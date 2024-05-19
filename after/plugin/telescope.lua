local builtin = require('telescope.builtin')
vim.keymap.set('n', 'fpf', builtin.find_files, {})
vim.keymap.set('n', 'fpg', builtin.git_files, {})
vim.keymap.set('n', 'fps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', 'fpl', builtin.live_grep, {})
