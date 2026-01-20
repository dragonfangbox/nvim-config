return {
	"lopi-py/luau-lsp.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "luau" },
	config = function ()
	 require("luau-lsp").setup {
      platform = { type = "roblox" },
	  types = { roblox_security_level = "PluginSecurity" },
      sourcemap = { enabled = true, autogenerate = true, sourcemapFile = "sourcemap.json" },
	  plugin = { enabled = true, port = 3667 },
	  server = { path = "/usr/local/bin/luau-lsp" }
    }
	end
}
