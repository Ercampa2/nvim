return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-buffer',
		'rafamadriz/friendly-snippets',
		'L3MON4D3/LuaSnip',
	},
	config = function()
		--LSP
		local lsp_zero = require 'lsp-zero'
		lsp_zero.on_attach(function(_, bufnr)
			local opts = {buffer = bufnr, remap = false}

			vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
			vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
			vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
			vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.signature_help() end, opts)
		end)

		require 'mason'.setup{}
		require 'mason-lspconfig'.setup{
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require 'lspconfig'.lua_ls.setup(lua_opts)
				end,

			}
		}

		-- LANGUAGE SERVERS
		require 'lspconfig'.emmet_language_server.setup{}
		require 'lspconfig'.cssls.setup{}
		require 'lspconfig'.eslint.setup{}
		require 'lspconfig'.html.setup{}
		require 'lspconfig'.jsonls.setup{}
		require 'lspconfig'.intelephense.setup{}
		require 'lspconfig'.tsserver.setup{}
		--require 'lspconfig'.php_cs.setup{}
		--require 'lspconfig'.php_cs_fixer.setup{}
		--require 'lspconfig'.jsonlint.setup{}
		--require 'lspconfig'.lua_language_server.setup{}

		-- CMP
		local cmp = require 'cmp'
		local cmp_select = {behavior = cmp.SelectBehavior.Select}

		require 'luasnip.loaders.from_vscode'.load({})

		cmp.setup({
			sources = {
				{name = 'path'},
				{name = 'luasnip'},
				{name = 'nvim_lsp'},
				{name = 'nvim_lua'},
				{name = 'buffer'},
			},
			formatting = lsp_zero.cmp_format(),
			mapping = cmp.mapping.preset.insert{
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-b>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({select = true}),
				['<C-space>'] = cmp.mapping.complete(),
			},
			preselect = 'item',
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})


	end,

}
