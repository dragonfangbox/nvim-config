return {
	"lopi-py/luau-lsp.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "luau" },
	config = function ()
	 require("luau-lsp").setup {
      platform = { type = "roblox" },
      sourcemap = { enabled = false, autogenerate = true},
    }
	end
}
