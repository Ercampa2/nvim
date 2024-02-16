return {
	--'navarasu/onedark.nvim',
    'rose-pine/neovim',
    name = 'rose-pine',
	config = function()
        require'rose-pine'.setup{}

        vim.cmd("colorscheme rose-pine")
		--require('onedark').setup {
		--	tranaparent = true,
		--	style = 'cool',
		--}
		--require('onedark').load()
	end
}
