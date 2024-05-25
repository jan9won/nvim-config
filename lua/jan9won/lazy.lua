local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = {
        "magick"
      }
    }
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  {
    -- Commenting
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },
  {
    "L3MON4D3/LuaSnip",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
  {
    "rafamadriz/friendly-snippets",
  },
  {
    "theprimeagen/harpoon",
  },
  {
    "folke/lsp-colors.nvim",
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Mason
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "jsonls",
          "lua_ls",
        }
      }
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {}
    end
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {}
    end
  },
  {
    "hrsh7th/nvim-cmp",
  },
  -- {
  --   'dense-analysis/ale',
  --   config = function()
  --     -- Configuration goes here.
  --     local g = vim.g
  --
  --     g.ale_ruby_rubocop_auto_correct_all = 1
  --     g.ale_linters_explicit = 1
  --     g.ale_fix_on_save = 1
  --
  --     g.ale_linters = {
  --       markdown = { 'prettier' }
  --       -- ruby = { 'rubocop', 'ruby' },
  --       -- lua = { 'lua_language_server' }
  --     }
  --     g.ale_fixers = {
  --       markdown = { 'prettier' }
  --     }
  --   end
  -- },
  {
    "neovim/nvim-lspconfig",
  },
  -- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && npx --yes yarn install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },
  -- {
  --   "davidgranstrom/nvim-markdown-preview",
  -- },
  {
    'nfrid/markdown-togglecheck',
    dependencies = { 'nfrid/treesitter-utils' },
    ft = { 'markdown' },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-tree/nvim-tree.lua",

    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate'
  },
  {
    "nvim-lua/plenary.nvim",
  },
  -- {
  --   "MunifTanjim/prettier.nvim",
  -- },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.6',
    dependencies = {
      -- brew install ripgrep
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    "folke/tokyonight.nvim",
    name = 'tokyonight'
  },
})
