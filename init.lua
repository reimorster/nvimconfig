require("config.options")

require("config.lazy")

-- require("config.plugins")

require("lazy").setup ( { import = "plugins" } )

vim.lsp.config("ruff", {
    init_options = {
        settings = { 
            organizeImports = true,
            lint = {
                enable = true,
                run = 'onType',
            },
            args = { "--ignore", "E501" },
            showSyntaxErrors = true
        },
    }
})


vim.lsp.enable("sourcekit")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")

vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP Actions',
        callback = function(args)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
        end,
})
