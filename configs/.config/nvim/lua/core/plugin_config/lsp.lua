local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.ensure_installed({
    'ansiblels',
    'clangd',
    'cmake',
    'dhall_lsp_server',
    'elixirls',
    'grammarly',
    'jsonls',
    'ltex',
    'rust_analyzer',
    'texlab',
    'yamlls',
})

lsp.setup()
