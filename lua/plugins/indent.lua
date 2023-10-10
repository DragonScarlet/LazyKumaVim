return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }
        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f7768e" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#bb9af7" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#2ac3de" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#9ece6a" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b4f9f8" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#7aa2f7" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#ff9e64" })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup { scope = { highlight = highlight }, indent = { char = "▏" }, }



        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
}
