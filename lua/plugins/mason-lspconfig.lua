return {
	"mason-org/mason-lspconfig.nvim",
	opts = { ensure_installed = { "pyright", "ruff", "rust_analyzer", "lua_ls" } },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
        config = function()
                vim.lsp.config("ruff", {
                        init_options = {
                                settings = {
                                        organizeImports = true,
                                        lint = {
                                                enable = true,
                                                run = "onType",
                                        },
                                        args = { "--ignore", "E501" },
                                        showSyntaxErrors = true,
                                },
                        },
                })

                vim.lsp.config("rust_analyzer", {
                        cmd = { "rustup", "run", "stable", "rust-analyzer" },
                })

                -- Enabling LSP Servers
                vim.lsp.enable("sourcekit")
                vim.lsp.enable("pyright")
                vim.lsp.enable("ruff")
                vim.lsp.enable("rust_analyzer")
                vim.lsp.enable("lua_ls")
        end
}
