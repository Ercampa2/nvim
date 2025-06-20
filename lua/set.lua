-- Line number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true



-- Undo
vim.opt.undofile = true
vim.opt.undodir = "C:\\Users\\gavea\\AppData\\Local\\nvim\\undodir"

-- Search
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true

-- Visual
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

vim.opt.list = true

--  Misc
vim.g.mapleader = " "
vim.opt.wrap = true
vim.opt.backup = false
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.swapfile = false
vim.opt.signcolumn = 'yes'
-- vim.opt.foldmethod = 'marker'
vim.opt.foldmethod = 'indent'
vim.opt.isfname:append('@-@')
vim.opt.splitbelow = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.guifont = "Symbols Nerd Font Mono"

vim.diagnostic.config({
    severity_sort = true,
    float = {border = 'rounded', source = 'if_many'},
    underline = {severity = vim.diagnostic.severity.ERROR},
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        }
    } or {},
    virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function (diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end
    }
})


-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- vim.lsp.config('cssls', { capabilities = capabilities })
-- vim.lsp.enable('cssls')
-- vim.lsp.enable('intelephense')
-- vim.lsp.enable('emmet_language_server')
