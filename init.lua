require("config.options")

require("config.lazy")

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

require("lazy").setup({ import = "plugins" })

require("config.keymappings")

-- LSP Configurations
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

-- vim.api.nvim_create_autocmd('LspAttach', {
--         desc = 'LSP Actions',
--         callback = function(args)
--             vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
--             vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
--         end,
-- })
--
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

require("colorizer").setup()

require("avante").setup({
	provider = "ollama",
	model = vim.env.OLLAMA_MODEL,
	providers = {
		ollama = {
			endpoint = vim.env.OLLAMA_BASE_URL,
			model = vim.env.OLLAMA_BASE_MODEL,
			is_env_set = require("avante.providers.ollama").check_endpoint_alive,
			timeout = 30000,
			extra_request_body = {
				temperature = 0,
				max_completion_tokens = 8192,
			},
		},
	},
	custom_tools = {
		require("mcphub.extensions.avante").mcp_tool("planning"),
	},
	system_prompt = function()
		local hub = require("mcphub").get_hub_instance()
		return hub:get_active_servers_prompt()
	end,
})

require("lazydev").setup({
	library = { "nvim-dap-ui" },
})

require("dap-python").setup("uv")
require("dap-python").test_runner = "pytest"
