return {
    "mason-org/mason-lspconfig.nvim",
    opts = { ensure_installed = { "pyright", "ruff", }, },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}

