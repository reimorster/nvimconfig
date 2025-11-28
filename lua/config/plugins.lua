
require("lazy").setup({
  { "neovim/nvim-lspconfig" },             -- Configuração de servidores LSP (Language Server Protocol)
  { "williamboman/mason.nvim", config = true },  -- Gerenciador para instalar servidores LSP, formatadores, etc.
  { "williamboman/mason-lspconfig.nvim", config = true }, -- Integra Mason com LSPConfig
  { "hrsh7th/nvim-cmp" },                  -- Plugin de autocompletar
  { "hrsh7th/cmp-nvim-lsp" },              -- Fonte de autocompletar baseada em LSP
  { "L3MON4D3/LuaSnip" },                  -- Snippets engine
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Realce de sintaxe e parsing moderno
  { "nvim-lualine/lualine.nvim", opts = {} }, -- Barra de status personalizável
  { "nvim-tree/nvim-tree.lua" },           -- Gerenciador de arquivos estilo VS Code
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Busca de arquivos e símbolos
})
