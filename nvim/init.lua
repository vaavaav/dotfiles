vim.o.ignorecase = true                                                 -- if true, ignore case in search patterns
vim.o.relativenumber = true                                             -- if true, show relative line numbers
vim.o.number = true                                                     -- if true, show absolute line numbers
vim.o.shiftwidth = 2                                                    -- number of spaces to use for each step of (auto)indent
vim.o.smarttab = true                                                   -- if true, insert indents automatically
vim.o.expandtab = true                                                  -- if true, convert tabs to spaces
vim.o.hlsearch = true                                                   -- if true, highlight search results
vim.g.mapleader = " "                                                   -- set leader key
vim.o.termguicolors = true                                              -- if true, use 24-bit RGB colors in the terminal

vim.keymap.set("n", "<CR>", ":noh<CR><CR>", { silent = true })          -- Clear search highlights after pressing enter
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true }) -- Toggle file explorer
vim.keymap.set("n", "<C-f>", ":FZF<CR>", { noremap = true })            -- Fuzzy finder
vim.keymap.set({ "n", "v" }, "<Leader>p", '"_dP')                       -- copy and paste without yanking
-- Smoother navigation
vim.keymap.set({ "n", "v" }, "<c-u>", "<c-u>zz")
vim.keymap.set({ "n", "v" }, "<c-d>", "<c-d>zz")
vim.keymap.set({ "n", "v" }, "n", "nzz")
vim.keymap.set({ "n", "v" }, "N", "Nzz")
-- Tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
-- Copilot
vim.g.copilot_no_tab_map = true                                                                                  -- if true, do not map <Tab> in insert mode
vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false }) -- Accept copilot suggestion
-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Plugins
require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- Packer can manage itself
  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- copilot
      { "github/copilot.vim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },             -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
    config = function()
      local lsp_zero = require("lsp-zero").preset({
        name = "minimal",
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false
      })
      lsp_zero.nvim_workspace()
      lsp_zero.ensure_installed({
        "ansiblels",
        "cmake",
        "clangd",
        "dhall_lsp_server",
        "elixirls",
        "grammarly",
        "jsonls",
        "ltex",
        "rust_analyzer",
        "texlab",
        "yamlls",
      })
      lsp_zero.setup()
    end,
  })
  -- Tmux
  use({
    "christoomey/vim-tmux-navigator",
    lazy = false,
  })
  use("nvim-tree/nvim-web-devicons") -- Icons
  -- Theme
  use({
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').load("wave")
    end
  })
  -- Bottom Status line
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'moonfly',
        },
        sections = {
          lualine_a = {
            {
              'filename',
              path = 1,
            }
          },
          lualine_b = { "branch", 'diff', 'diagnostics' },
        }
      }
    end,
  })
  use("junegunn/fzf") -- Fuzzy finder
  -- Diagnostics with virtual text on the top right corner
  use({
    'dgagn/diagflow.nvim',
    config = function()
      require('diagflow').setup()
    end
  })
  -- File explorer
  use({
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
          git_ignored = false,
        },
      })
    end,
  })
  -- Terminal in neovim
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })
  use 'mg979/vim-visual-multi' -- Multiple cursors
  -- alpha-nvim
  use({
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  })
end)
