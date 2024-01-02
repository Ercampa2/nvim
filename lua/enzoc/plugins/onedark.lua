return {
	'navarasu/onedark.nvim',
	config = function()
		require('onedark').setup {
			tranaparent = true,
			style = 'cool',
		}
		require('onedark').load()
	end
}
