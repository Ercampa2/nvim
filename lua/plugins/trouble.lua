return {
    'folke/trouble.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
        local trouble = require("trouble")
        trouble.setup{}

        vim.keymap.set('n', '<leader>t', function() trouble.toggle() end)
        vim.keymap.set('n', '[d', function() trouble.next({skip_groups = true, jump = true}) end)
        vim.keymap.set('n', ']d', function() trouble.previous({skip_groups = true, jump = true}) end)
    end,
}
