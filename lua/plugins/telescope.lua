return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	config = function()
		require("telescope").setup({
			defaults = { file_ignore_patterns = { "%.git/", "node_modules" } },
			pickers = { find_files = { hidden = true } },
		})
	end,
}
