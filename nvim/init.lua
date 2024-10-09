----------------------------------------------------------------------------------------
-- General settings
----------------------------------------------------------------------------------------
vim.o.ignorecase = true                                        -- if true, ignore case in search pattern
vim.o.relativenumber = true                                    -- if true, show relative line numbers
vim.o.shiftwidth = 2                                           -- number of spaces to use for each step of (auto)indent
vim.o.smarttab = true                                          -- if true, insert indents automatically
vim.o.expandtab = true                                         -- if true, convert tabs to spaces
vim.o.hlsearch = true                                          -- if true, highlight search results
vim.g.mapleader = " "                                          -- set leader key
vim.g.maplocalleader = "\\"
vim.o.termguicolors = true                                     -- if true, use 24-bit RGB colors in the terminal

vim.keymap.set("n", "<CR>", ":noh<CR><CR>", { silent = true }) -- Clear search highlights after pressing enter
vim.keymap.set({ "n", "v" }, "<Leader>p", '"_dP')              -- copy and paste without yanking
vim.keymap.set({ "n", "v" }, "<c-u>", "<c-u>zz")
vim.keymap.set({ "n", "v" }, "<c-d>", "<c-d>zz")
vim.keymap.set({ "n", "v" }, "n", "nzz")
vim.keymap.set({ "n", "v" }, "N", "Nzz")
----------------------------------------------------------------------------------------
-- Bootstrap lazy
----------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
----------------------------------------------------------------------------------------
-- Setup lazy and plugins
----------------------------------------------------------------------------------------
require("lazy").setup({
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    "junegunn/fzf",
    config = function()
      vim.keymap.set("n", "<C-f>", ":FZF<CR>", { noremap = true })
    end,
  },
  { "jinh0/eyeliner.nvim" },
  {
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  {
    'dgagn/diagflow.nvim',
    config = function()
      require('diagflow').setup()
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
      vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
      vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
      vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
    end,
  },
  {
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
  },
  {
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
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- copilot
      -- {
      --   "github/copilot.vim",
      --   config = function()
      --     vim.g.copilot_no_tab_map = true
      --     vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false }) -- Accept copilot suggestion
      --   end,
      -- },

      -- Snippets
      { "L3MON4D3/LuaSnip" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      local lsp_attach = function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, perserve_mappings = false })
      end

      lsp_zero.extend_lspconfig({
        lsp_attach = lsp_attach,
        set_lsp_keymaps = true,
      })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })

      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        snippet = {
          expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({}),
      })

      -- format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buffer,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
})
