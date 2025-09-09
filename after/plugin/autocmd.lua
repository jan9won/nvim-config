---------- Conceal in Markdown ----------
-- vim.cmd [[
--   " Highlight markdown link URLs differently
--   syntax match markdownLinkURL /\v\([^\)]+\)/ contained containedin=markdownLink conceal
--   syntax match markdownLinkText /\v\[.*\]/ contained containedin=markdownLink
--   syntax match markdownLink /\v\[.*\]\([^\)]+\)/ contains=markdownLinkText,markdownLink,markdownLinkURL
--
--   " Set conceal for URLs
--   hi link markdownLinkURL Conceal
--   hi link markdownLinkText NONE
--   set conceallevel=1
--   set concealcursor=nc
-- ]]

---------- Word Wrapping & Conceal in Markdown ----------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- vim.opt_local.wrapmargin = 0
    vim.opt_local.textwidth = 79
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt.formatoptions:append("t")

    -- vim.api.nvim_create_autocmd('WinResized', {
    --   callback = set_window_max_columns,
    -- })
  end
})

---------- Open nvim-tree when opening ----------
vim.api.nvim_create_autocmd("VimEnter", {
  command = ":NvimTreeOpen",
})

---------- Close nvim-tree before leaving ----------
vim.api.nvim_create_autocmd("VimLeavePre", {
  command = ":NvimTreeClose",
})

---------- Save this session as a file ----------
vim.api.nvim_create_user_command(
  "S",
  "mksession!",
  {}
)

---------- Markdown autoformatting with `remark-cli` when lspzero and remark_ls are not working ----------
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = vim.api.nvim_create_augroup("RemarkFormat", { clear = true }),
--   pattern = "*.md",
--   callback = function()
--     local file_path = vim.fn.expand("%:p") -- Get the full file path
--     vim.cmd(string.format("silent !npx remark-cli \"%s\" --output", file_path))
--   end,
-- })

---------- Also markdown autoformatting but async ----------
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


---------- sql_ls autoformatting "inside Typescript" ----------
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
