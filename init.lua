-- boot lazypath	
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
	vim.api.nvim_echo({
	  { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
	  { out, "WarningMsg" },
	  { "\nPress any key to exit..." },
	}, true, {})
	vim.fn.getchar()
	os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set the leader key to space
vim.g.mapleader = " "

-- Auto add ending brackets and other things
vim.api.nvim_set_keymap('i', '{', '{}<Esc>ha', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<Esc>ha', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Esc>ha', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Esc>ha', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Esc>ha", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '`', '``<Esc>ha', { noremap = true, silent = true })

-- open telescope (see plugins) 
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', { noremap = true, silent = true })

-- Split vertically
vim.api.nvim_set_keymap('n', '<leader>ss', ':vs<CR>', { noremap = true, silent = true })

-- split horizontally with terminal
vim.api.nvim_set_keymap('n', '<leader>cl', ':belowright split | term<CR> ', { noremap = true, silent = true})

-- make new tab 
vim.api.nvim_set_keymap('n', '<leader>nt', ':tabnew<CR>', { noremap = true, silent = true})

-- Quick save
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- set esc to exit terminal mode
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>', { noremap = true, silent = true })

-- show error message
vim.api.nvim_set_keymap('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

-- General configurations
vim.cmd('syntax on')

vim.opt.errorbells = false
vim.opt.visualbell = false

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.wildmenu = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.ignorecase = true

vim.opt.splitright = true

-- show inline errors 
vim.diagnostic.config({ virtual_text = true })

-- limit autocomplete to show 10 itmes
vim.opt.pumheight = 10

-- setup lazy and plugins
require("lazy").setup{
	spec = {
		{import = "plugins"},
	},

	install = {colorscheme = {"hybrid"}},

	checker = {enabled = true, notify = false},
}

--colorscheme stuff
vim.cmd('colorscheme hybrid')
vim.opt.termguicolors = true

-- setup lsp
require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {"lua_ls", "clangd", "glsl_analyzer", "zls", "basedpyright", "ocamllsp", "hls", "gopls"},
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup({
	handlers = {
		function(serverName)
			lspconfig[serverName].setup({
				capabilities = capabilities,
			})
		end
	},
})

-- setup each language server
-- (i learned mason does this automatically, 
--  so i was double loading LSPs.)
--local lspconfig = require("lspconfig")
--lspconfig.lua_ls.setup{capabilities = capabilities,}
--lspconfig.clangd.setup{capabilities = capabilities,}
--lspconfig.glsl_analyzer.setup{capabilities = capabilities,}
--lspconfig.zls.setup{capabilities = capabilities,}
--lspconfig.basedpyright.setup{capabilities = capabilities,}
--lspconfig.ocamllsp.setup{capabilities = capabilities,}
--lspconfig.hls.setup{capabilities = capabilities,}

-- turn off zig auto-format
vim.g.zig_fmt_autosave = 0

