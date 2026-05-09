require('config.keymaps')
require('config.options')

local plugins = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.readdir(plugins)) do
    if file:match("%.lua$") then
        local name = file:gsub("%.lua$", "")
        require("plugins." .. name)
    end
end
