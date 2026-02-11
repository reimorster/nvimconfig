local o = vim.opt

o.number = true           -- Exibe número das linhas
o.relativenumber = true   -- Mostra números relativos (útil para navegação com hjkl)

o.expandtab = true        -- Converte TAB em espaços
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

o.foldlevel = 99

vim.cmd("syntax enable")
vim.cmd("filetype on")
vim.cmd("filetype plugin indent on")
