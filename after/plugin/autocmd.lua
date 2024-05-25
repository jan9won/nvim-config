-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
--   command = "if mode() != 'c' | checktime | endif",
--   pattern = { "*" },
-- })
-- local function set_window_max_columns()
--   if vim.bo.filetype == 'markdown' then
--     -- Get the current window ID
--     local win_id = vim.api.nvim_get_current_win()
--     -- Get the width of the screen
--     local screen_width = vim.o.columns
--     -- Set the current window's width to the screen width
--     vim.api.nvim_win_set_width(win_id, screen_width)
--   end
-- end


vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- set_window_max_columns();
    -- vim.opt_local.textwidth = vim.api.nvim_win_get_width(0)
    vim.opt_local.wrap = true
    vim.opt_local.wrapmargin = 0
    -- vim.opt_local.columns = vim.api.nvim_win_get_width(0)

    -- vim.api.nvim_create_autocmd('WinResized', {
    --   callback = set_window_max_columns,
    -- })
  end
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

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = vim.api.nvim_create_augroup("RemarkFormat", { clear = true }),
--   pattern = "*.md",
--   callback = function()
--     local file_path = vim.fn.expand("%:p") -- Get the full file path
--     vim.cmd(string.format("silent !npx remark-cli \"%s\" --output", file_path))
--   end,
-- })

-- -- Create an autocommand group
-- local group = vim.api.nvim_create_augroup("RemarkFormat", { clear = true })
--
-- -- Define the autocommand
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = group,
--   pattern = "*.md",
--   callback = function()
--     local file_path = vim.fn.expand("%:p") -- Get the full file path
--
--     -- Run the command asynchronously
--     local handle
--     local function on_exit(job_id, code, event_type)
--       if code ~= 0 then
--         vim.api.nvim_err_writeln("remark-cli failed with code " .. code)
--       end
--     end
--
--     handle = vim.loop.spawn("npx", {
--       args = { "remark-cli", file_path, "--output" },
--       stdio = { nil, nil, nil }
--     }, vim.schedule_wrap(function(code)
--       on_exit(nil, code, nil)
--       if handle then
--         handle:close()
--       end
--     end))
--   end,
-- })


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
