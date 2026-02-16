-- Define o caminho onde o Lazy será instalado
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Verifica se o Lazy já existe no sistema de arquivos
if not vim.loop.fs_stat(lazypath) then
	-- Caso não exista, faz o clone do repositório estável
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Adiciona o Lazy.nvim ao runtime path do Neovim
vim.opt.rtp:prepend(lazypath)
