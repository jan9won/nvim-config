local lsp = require('lsp-zero').preset {}

local lspconfig = require('lspconfig')

-- Autocompletion with cmp
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local luasnip = require('luasnip')

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  -- ['<C-h>'] = function()
  -- vim.cmd.stopinsert()
  -- vim.lsp.buf.()
  --   vim.defer_fn(function() vim.cmd.wincmd("w") end, 100)
  --   vim.keymap.set("n", "q", ":close<CR>", { buffer = true })
  -- end,
  -- ["<C-l>"] = cmp.mapping.complete(),
  ["<Tab>"] = cmp.mapping(function(fallback)
    local status_ok, luasnip = pcall(require, "luasnip")
    if status_ok and luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    local status_ok, luasnip = pcall(require, "luasnip")
    if status_ok and luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" })
})

-- snippets
-- rafamadriz/friendly-snippets (https://github.com/rafamadriz/friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
  paths = "./snippets"
})

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  mapping = cmp_mappings,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  -- servers = {
  --   sqlls = {},
  -- }
})

---------- LSP CONFIG, KEY MAPPING ----------
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- Manual
  -- https://neovim.io/doc/user/lsp.html#lsp-buf
  vim.diagnostic.config({ virtual_text = false })

  vim.keymap.set("n", "gp", function() vim.diagnostic.open_float({ source = true }) end, opts)
  vim.keymap.set("n", "gj", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "gk", function() vim.diagnostic.goto_prev() end, opts)

  vim.keymap.set("n", "gdd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gds", function() vim.cmd.vsplit(vim.lsp.buf.definition()) end, opts)
  vim.keymap.set("n", "gdt", function() vim.cmd.tabe(vim.lsp.buf.definition()) end, opts)

  vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)

  vim.keymap.set("n", "gsw", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "gsd", function() vim.lsp.buf.document_symbol() end, opts)

  vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "gca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "grf", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

---------- SERVER CONFIGS  ----------

lspconfig.nginx_language_server.setup {}

lspconfig.tsserver.setup {
  single_file_support = false
}

lspconfig.eslint.setup({
  -- on_attach = function(client, bufnr)
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.mjs', '*.mts' },
  --     command = 'silent! EslintFixAll',
  --   })
  -- end
})

lspconfig.stylelint_lsp.setup {
  settings = {
    stylelintplus = {
    }
  }
}

-- lspconfig.pylsp.setup {}
lspconfig.pyright.setup {}

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  },
  workspace = {
    -- Make the server aware of Neovim runtime files
    library = vim.api.nvim_get_runtime_file("", true),
    checkThirdParty = false,
  },

})

-- local jsonCapabilities = vim.lsp.protocol.make_client_capabilities()
-- jsonCapabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup {}

---------- Markdown ----------
lspconfig.marksman.setup {}
lspconfig.remark_ls.setup {
  -- cmd = { "remark-language-server", "--stdio" },
  -- requireConfig = false
}
-- lspconfig.prettier.setup {}

lspconfig.bashls.setup {}
lspconfig.yamlls.setup {}

lspconfig.sqlls.setup {
  cmd = {
    'sql-language-server', 'up', '--method', 'stdio', '--debug'
  },
  filetypes = {
    'sql', 'mysql'
  }
}

---------- FORMAT ON SAVE ----------
lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['eslint'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'typescript.jsx', 'javascript.jsx' },
    ['jsonls'] = { 'json' },
    ['bash_ls'] = { 'sh' },
    ['remark_ls'] = { 'markdown' }
  }
})
lsp.setup()

-- ---------- Autocommands that should be called after LSP ----------
--
-- local function rename_markdown_with_heading()
--   -- Get the current buffer's file name and directory
--   local buf_name = vim.api.nvim_buf_get_name(0)
--   local buf_dir = vim.fn.fnamemodify(buf_name, ":h")
--
--   -- Read the first line of the file
--   local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
--
--   -- Extract the top heading
--   local heading = first_line:match("^#%s*(.+)")
--   if not heading then
--     -- If no heading is found, do nothing
--     return
--   end
--
--   -- Sanitize the heading to create a valid file name
--   -- 1. Camelcase with underscore
--   -- local sanitized_heading = heading:gsub("[^%w%s-_]", ""):gsub("%s+", "_")
--   -- 2. Lowercase with hyphen (kebab-case)
--   local sanitized_heading = heading:lower():gsub("[^%w가-힣]", "-"):gsub("%s+", "-")
--
--   -- Construct the new file name
--   local new_name = buf_dir .. "/" .. sanitized_heading .. ".md"
--
--   -- print(buf_name);
--
--   -- Check if the new name is different from the current name
--   if new_name ~= buf_name and buf_name ~= buf_dir .. "/" .. "README.md" then
--     -- Rename the file
--     local ok, err = vim.loop.fs_rename(buf_name, new_name)
--     if not ok then
--       vim.api.nvim_err_writeln("Failed to rename file: " .. err)
--       return
--     end
--
--     -- Update the buffer to reflect the new file name
--     vim.api.nvim_buf_set_name(0, new_name)
--
--     -- Reload the buffer to ensure it is pointing to the new file
--     vim.cmd("edit!")
--   end
-- end
--
-- -- Create an autocommand group to avoid duplications
-- local augroup = vim.api.nvim_create_augroup("RenameMarkdownWithHeading", { clear = true })
--
-- -- Define the autocommand with a delay to ensure it runs after formatting
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = augroup,
--   pattern = "*.md",
--   callback = function()
--     rename_markdown_with_heading()
--   end,
-- })
