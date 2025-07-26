return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true},
			indent = {enable = true},
			ensure_installed = {
				"json",
				"c",
				"cpp",
				"go",
				"css",
				"html",
				"lua",
				"zig",
				"tmux",
				"ocaml"
			}
		})
	end
}
