return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,

    -- 'navarasu/onedark.nvim',
    -- rose-pine/neovim',
    -- name = 'rose-pine',

	config = function()
        require'catppuccin'.setup{
            transparent_background = true
        }
        vim.cmd("colorscheme catppuccin")

        -- require'rose-pine'.setup{
        --     variant = "auto",
        --     styles = {
        --         transparency = true
        --     }
        --
        -- }

        -- vim.cmd('colorscheme rose-pine')
        --
		--require('onedark').setup {
		--	transparent = true,
		--	style = 'cool',
		--}
		--require('onedark').load()
	end
}
