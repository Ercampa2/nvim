vim.pack.add({
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/saghen/blink.compat",
    "https://github.com/saghen/blink.lib",
    "https://github.com/saghen/blink.cmp",
})

local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({
    paths = "~/.config/nvim/lua/snippets"
})

require('blink.cmp').setup({
    snippets = {
        preset = 'luasnip',
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },

        providers = {
            snippets = {
                name = "snippets",
                module = "blink.cmp.sources.snippets",
            },
        },
    },

    appearance = {
        nerd_font_variant = 'mono'
    },

    fuzzy = {
        implementation = "prefer_rust_with_warning",
    },
})
