--- AI inside NVIM

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	opts = {
        provider = "ollama",
                providers = {
                        ollama = {
                                endpoint = vim.env.OLLAMA_BASE_URL,
                                model = vim.env.OLLAMA_BASE_MODEL,
                                },
                },
                instructions_file = "avante.md",
        },
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
                "ravitemer/mcphub.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are used for caching, see `Caching` section
		"nvim-tree/nvim-web-devicons",
	},
}
