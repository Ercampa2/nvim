return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require 'lualine'.setup({
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
    end
}

