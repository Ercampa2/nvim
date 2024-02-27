return {
    'akinsho/toggleterm.nvim', 
    config = function()
        require("toggleterm").setup{
            direction = "float",
            open_mapping = [[<c-\>]],
        }
		-- vim.keymap.set('n', '<C-/>', ':ToggleTerm<CR>')
    end
}

