local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better navigation on wrapped lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Stay in visual mode when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Split smarter
map("n", "<leader>sv", "<C-w>v", opts) -- vertical split
map("n", "<leader>sh", "<C-w>s", opts) -- horizontal split
map("n", "<leader>se", "<C-w>=", opts) -- equalize
map("n", "<leader>sx", ":close<CR>", opts)

-- Buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Quick save / quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>x", ":x<CR>", opts)

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)

-- Paste without losing yank
map("v", "p", '"_dP', opts)

-- Delete into black hole
map({ "n", "v" }, "<leader>d", '"_d', opts)

-- Select everything
map("n", "<leader>a", "ggVG", opts)

-- Diagnostics (no plugin needed)
map("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Float. Window" })
map("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Go to prev" })
map("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Go to next" })
map("n", "<leader>qf", vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "Set loc. list" })

-- Exit terminal with <Esc>
map("t", "<Esc>", [[<C-\><C-n>]], opts)

local telescope = require("telescope.builtin")
-- Define atalho para abrir o Telescope (busca de arquivos)
map("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find" })
map("n", "<leader>ff", telescope.find_files, { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>fg", telescope.live_grep, { noremap = true, silent = true, desc = "Live grep" })
map("n", "<leader>fb", telescope.buffers, { noremap = true, silent = true, desc = "Buffers" })
map("n", "<leader>fh", telescope.help_tags, { noremap = true, silent = true, desc = "Help Tags" })

-- Split navigation
-- same for tmux, must use vim-tmux-navigator plugin
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Allow Ctrl-h/j/k/l from terminal mode
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { silent = true })
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { silent = true })
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { silent = true })
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { silent = true })

-- Lsp

map("n", "gd", vim.lsp.buf.definition, { silent = true, noremap = true, desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { silent = true, noremap = true, desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { silent = true, noremap = true, desc = "Go to impl." })
map("n", "gr", vim.lsp.buf.references, { silent = true, noremap = true, desc = "References" })
map("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true, desc = "Hover" })

map("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, noremap = true, desc = "LSP Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>f", vim.lsp.buf.format, { silent = true, noremap = true, desc = "LSP Format" })

map("n", "gl", vim.diagnostic.open_float, { desc = "Diag. float window" })

map("n", "gK", function()
	local new_config = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Diag. virtual_lines" })

-- Define atalho para abrir/fechar o NvimTree (explorador de arquivos)
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "File tree" })
