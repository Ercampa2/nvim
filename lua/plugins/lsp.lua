vim.pack.add({
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/folke/lazydev.nvim",
})

local servers = {
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
    "qmlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
})

require("lazydev").setup({
    library = {
        {
            path = "${3rd}/luv/library",
            words = { "vim%.uv" },
        }
    }
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

for _, server in ipairs(servers) do
    local config = {
        capabilities = capabilities,
    }

    if server == "lua_ls" then
        config.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        }
    end

    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

require('fidget').setup{}
