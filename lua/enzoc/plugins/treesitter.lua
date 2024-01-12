return {
	'nvim-treesitter/nvim-treesitter',
	config = function ()
		require 'nvim-treesitter.install'.prefer_git = false
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { 'javascript', 'php', 'sql', 'c', 'lua', 'jsdoc'},
			auto_install = true,
			highlight = {
				enable = true
			}
        }
	end,
	build = ':TSUpdate',
}
