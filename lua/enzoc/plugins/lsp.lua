return {
	'neovim/nvim-lspconfig',
	branch = 'master',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-buffer',
        'j-hui/fidget.nvim',
	},
	config = function()
		-- LSP
		local cmp = require 'cmp'
        local cmp_lsp = require 'cmp_nvim_lsp'
		local cmp_select = {behavior = cmp.SelectBehavior.Select}

        local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require 'fidget'.setup{}
		require 'mason'.setup{}
		require 'mason-lspconfig'.setup{
            ensure_installed = {
                'emmet_language_server',
                'cssls',
                'eslint',
                'html',
                'jsonls',
                'intelephense',
                'tsserver',
                'pyright',
                --'lua_ls',
            },
			handlers = {
               function (server_name)
                   require("lspconfig")[server_name].setup {
                       capabilities = capabilities
                   }
               end,
               ['lua_ls'] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }
                                }
                            }
                        }
                    }
               end
			}
		}

        -- Autocomplete
		cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
			sources = {
				{name = 'path'},
				{name = 'luasnip'},
				{name = 'nvim_lsp'},
				{name = 'buffer'},
			},
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

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = 'rounded',
                header = '',
                prefix = '',
            }
        })

        --Java
        require('lspconfig').jdtls.setup({})
	end,

}
