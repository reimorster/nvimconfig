return { "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "ollama",
    instructions_file = "avante.md",
    providers = {
        ollama = {
            endpoint="http://192.168.0.105:11434",
            model = "hf.co/mradermacher/NextCoder-7B-i1-GGUF:latest",
            timeout = 30000,
            extra_request_body = {
                    temperature=0,
                    max_completion_tokens=8192,
            },
        },
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are used for caching, see `Caching` section
    "nvim-tree/nvim-web-devicons",
  },
}

