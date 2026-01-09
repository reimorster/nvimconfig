return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main', 
    lazy = false,
    build = ":TSUpdate",
    ensure_installed = { "lua","pest", "python", "rust", "markdown" , "toml", "json", "swift" , },
    config = function() 
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'python', 'rust', 'swift' },
            callback = function() vim.treesitter.start() end,
        })
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
}
