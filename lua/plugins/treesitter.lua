return {
	'nvim-treesitter/nvim-treesitter',
	config = function ()
		require 'nvim-treesitter.install'.prefer_git = true
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { 'javascript', 'php', 'sql', 'c', 'lua', 'html', 'css', 'go'},
			auto_install = true,
			highlight = {
				enable = true
			},
            indent = {
                enable = true,
            }
        }
	end,
	build = ':TSUpdate',
}
