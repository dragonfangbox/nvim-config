return {
	{"hrsh7th/nvim-cmp", config = function()
		local cmp = require'cmp'
		cmp.setup {
			completion = {
					completeopt = 'menuone, noinsert',
				},

			window = {
				documentation = cmp.config.window.bordered()

			},
			mapping = {
			  ['<Tab>'] = cmp.mapping.select_next_item(),
			  ['<S-Tab>'] = cmp.mapping.select_prev_item(),
			  ['<CR>'] = cmp.mapping.confirm({ select = true }),
			},
			sources = {
			  { name = 'nvim_lsp' },
			  { name = 'buffer' },
			  { name = 'path' },
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		  }
		end

	},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-nvim-lsp"},

}
