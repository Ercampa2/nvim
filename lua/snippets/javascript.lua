local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep

return {
    s("fetch", {
        t("let "),
        i(1, "dados"),
        t({
            " = HU.fetch(hooxData.controllerUrl, {})",
            "if ("
        }),
        rep(1),
        t(" instanceof Error) return console.error("),
        rep(1),
        t(")"),
    })
}
