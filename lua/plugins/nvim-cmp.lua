return {
	{"hrsh7th/nvim-cmp", config = function()
		require'cmp'.setup {
			snippet = {
				expand = function() end,
			},

			completion = {
					completeopt = 'menuone, noselect',
				},

			window = {
				documentation = require'cmp'.config.window.bordered()

			},
			mapping = {
			  ['<Down>'] = require'cmp'.mapping.select_next_item(),
			  ['<Up>'] = require'cmp'.mapping.select_prev_item(),
			  ['<C-d>'] = require'cmp'.mapping.scroll_docs(4),
			  ['<C-u>'] = require'cmp'.mapping.scroll_docs(-4),
			  ['<C-Space>'] = require'cmp'.mapping.complete(),
			  ['<CR>'] = require'cmp'.mapping.confirm({ select = true }),
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
