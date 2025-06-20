-- return {}
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "j-hui/fidget.nvim",
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = {"vim%.uv"}}
                }
            }
        }
    },

    config = function()
        require 'mason'.setup{}
        require 'mason-lspconfig'.setup({
            ensure_installed = {
                "lua_ls",
                "cssls",
                "eslint",
                "emmet_language_server",
                "html",
                "jsonls",
                "marksman",
                "intelephense",
                "sqlls",
                "gopls",
                "ts_ls",
            },
            handlers = {
                function (server_name)
                    if server_name == "lua_ls" then
                        vim.lsp.config('lua_ls', {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        })
                    end

                    vim.lsp.enable(server_name)
                    -- local config = {
                    --     single_file_support = true,
                    -- }

                    -- require'lspconfig'[server_name].setup(config)
                end,
            }
        })

        -- local capabilities = require('blink.cmp').get_lsp_capabilities()
        -- require('lspconfig').lua_ls.setup {capabilities = capabilities}
        -- require('lspconfig').intelephense.setup {capabilities = capabilities}
        require 'fidget'.setup{}
    end
}
