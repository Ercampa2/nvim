return {
    'akinsho/toggleterm.nvim',
    config = function ()
        require'toggleterm'.setup{
            open_mapping = [[<c-\>]],
            insert_mappings = true
        }
    end
}
