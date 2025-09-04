return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
		-- add LSPs here
		ensure_installed = {"lua_ls",
							"clangd",
							"glsl_analyzer",
							"zls",
							"basedpyright",
							"ocamllsp",
							"hls",
							"gopls",
		},
	},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    }
}
