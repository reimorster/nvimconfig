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
