local o = vim.opt

o.number = true           -- Exibe número das linhas
o.relativenumber = true   -- Mostra números relativos (útil para navegação com hjkl)

o.expandtab = true        -- Converte TAB em espaços
o.shiftwidth = 4          -- Define 2 espaços para indentação
o.tabstop = 4             -- Define largura visual de TAB como 2 espaços
o.autoindent = true
o.smartindent = true      -- Ativa indentação inteligente

o.wrap = false            -- Desativa quebra automática de linha

o.termguicolors = true    -- Habilita cores 24-bit no terminal
o.background = "dark"

o.cursorline = true       -- Destaca a linha atual

o.signcolumn = "yes"      -- Mantém a coluna de sinais visível (diagnósticos, git, etc.)
o.clipboard = "unnamedplus" -- Usa o clipboard do sistema (copiar/colar globalmente)

o.ignorecase = true 
o.smartcase = true

o.swapfile = false

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- Define atalho para abrir/fechar o NvimTree (explorador de arquivos)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Define atalho para abrir o Telescope (busca de arquivos)
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })

