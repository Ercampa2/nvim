local ok, configs = pcall(require, "nvim-treesitter.configs")

if not ok then
    return
end

require("nvim-treesitter.install").prefer_git = true

configs.setup({
    ensure_installed = {
        "javascript",
        "php",
        "sql",
        "c",
        "lua",
        "html",
        "css",
        "go",
    },

    auto_install = true,

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})
