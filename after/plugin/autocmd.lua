vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  command = ":NvimTreeClose",
})

vim.api.nvim_create_user_command(
  "S",
  "mksession!",
  {}
)

-- api.nvim_create_autocmd("VimLeavePre", {
--     command = "mksession!",
-- })
--
vim.api.nvim_create_autocmd("VimEnter", {
  command = ":NvimTreeOpen",
})

-- api.nvim_create_autocmd("VimEnter", {
--     command = "mksession!",
-- })
--


-- local function custom_sql_autocomplete()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   local line_text = vim.api.nvim_get_current_line()
--   local before_cursor = line_text:sub(1, col)
--
--   -- Check if the cursor is inside a `sql` template tag
--   if before_cursor:match("sql`.*$") then
--     -- Trigger `sqlls` autocompletion
--     vim.lsp.buf_request(0, 'textDocument/completion', {
--       textDocument = { uri = vim.uri_from_bufnr(0) },
--       position = { line = line - 1, character = col },
--     }, function(err, result, ctx)
--       if err or not result then return end
--
--       local items = vim.lsp.util.extract_completion_items(result)
--       local formatted_items = {}
--
--       for _, item in ipairs(items) do
--         table.insert(formatted_items, vim.lsp.util.text_document_completion_list_to_complete_items(item, "sql "))
--       end
--
--       vim.api.nvim_call_function('complete', { col, formatted_items })
--     end)
--   end
-- end
--
-- vim.api.nvim_create_autocmd({ "InsertEnter", "TextChangedP" }, {
--   pattern = "*.ts",
--   callback = custom_sql_autocomplete,
-- });

