vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",
})

require('lualine').setup({
    sections = {
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
            'os.date("%a, %c")',
        }
    },
    globalstatus = true
})
