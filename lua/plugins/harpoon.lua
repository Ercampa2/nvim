return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	requires = {
		{'nvim-lua/plenary.nivm'}
	},
	config = function ()
		local harpoon = require 'harpoon'
		harpoon:setup()
		
		-- Setup comands
		vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
		vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		-- Change files
		vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)
		vim.keymap.set('n', '<C-j>', function() harpoon:list():select(2) end)
		vim.keymap.set('n', '<C-k>', function() harpoon:list():select(3) end)
		vim.keymap.set('n', '<C-l>', function() harpoon:list():select(4) end)

		vim.keymap.set('n', '<C-s-p>', function() harpoon:list():prev() end)
		vim.keymap.set('n', '<C-s-n>', function() harpoon:list():next() end)
	end

}

