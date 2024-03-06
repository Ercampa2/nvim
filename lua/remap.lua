vim.g.mapleader = " "
vim.keymap.set('n','<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', "K", ":m '<-2<CR>gv==gv") -- Move a linha inteira
vim.keymap.set('v', "J", ":m '>+1<CR>gv==gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz') -- recentraliza ao mover
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv') -- centraliza ao passar ao proximo resultado da busca
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n','<leader>p', "\"_dP") -- ao colar sobre algo, não substitui

vim.keymap.set('n', "<leader>y", "\"+y") -- Copia para o clipoard do OS
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")

vim.keymap.set('n', '<leader>s', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") -- Replace em massa

vim.api.nvim_create_autocmd('LspAttach',{
    callback = function(ev)
        local opts = {buffer = ev.buf}

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<leader>ter', function() vim.lsp.buf.signature_help() end, opts)
    end
})

vim.keymap.set('n', '<leader>h', ':set hlsearch!<CR>')

