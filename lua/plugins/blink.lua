-- return{}
return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@type blink.cmp.Config
    ---@module 'blink.cmp'
    opts = {
       sources = {
            default = {'lsp', 'path', 'snippets', 'buffer'}
        }
    },
}

