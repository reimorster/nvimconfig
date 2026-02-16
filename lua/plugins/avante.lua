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
				model = vim.env.OLLAMA_MODEL,
			},
			---			openrouter = {
			---				__inherited_from = "openai",
			---				endpoint = "https://openrouter.ai/api/v1",
			---				api_key_name = "OPENROUTER_API_KEY",
			---				model = "z-ai/glm-5",
			---			},
		},

		input = {
			provider = "snacks",
			provider_opts = {
				title = "Avante Input",
				icon = " ",
			},
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"ravitemer/mcphub.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim", -- for input provider snacks
		--- The below dependencies are used for caching, see `Caching` section
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
		"nvim-tree/nvim-web-devicons",
	},
}
