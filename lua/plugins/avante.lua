--- AI inside NVIM

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	opts = {
		instructions_file = "avante.md",
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are used for caching, see `Caching` section
		"nvim-tree/nvim-web-devicons",
	},
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
}
