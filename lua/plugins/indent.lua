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

        local function tokyo_highlights()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f7768e" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#bb9af7" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#2ac3de" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#9ece6a" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b4f9f8" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#7aa2f7" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#ff9e64" })
        end

        local function cat_highlights()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#d98786" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#aecf90" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#e0c996" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#91a9e8" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#eabae1" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#90c6bd" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#b6bedf" })
        end

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes



        hooks.register(hooks.type.HIGHLIGHT_SETUP, tokyo_highlights)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup {
            whitespace = {
                remove_blankline_trail = false,
            },
            scope = { highlight = highlight },
            indent = {
                char = "▏",
            },
        }



        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end
}
