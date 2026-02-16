require("config.options")

require("config.lazy")

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

require("lazy").setup({ import = "plugins" })

require("config.keymappings")

-- vim.api.nvim_create_autocmd('LspAttach', {
--         desc = 'LSP Actions',
--         callback = function(args)
--             vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
--             vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
--         end,
-- })
--

-- TODO: maybe move to a separate file in future
vim.diagnostic.config({
	virtual_text = {
		enabled = true,
		-- Options can be set here:
		severity_sort = true, -- Optional: sort messages by severity
		-- source = "always",    -- Optional: show source name
		-- ... and more (see :help vim.diagnostic.config)
	},
	signs = true, -- Shows icons in the sign column (gutter)
	underline = true, -- Underlines the problematic text
	update_in_insert = false, -- Don't update diagnostics while in insert mode (optional)
})


--- rgb colors
require("colorizer").setup()

--- debug adapter protocol
require("lazydev").setup({
	library = { "nvim-dap-ui" },
})

require("dap-python").setup("uv")
require("dap-python").test_runner = "pytest"

require("avante").setup({
        provider = "ollama"
})
