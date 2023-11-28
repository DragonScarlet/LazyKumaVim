return {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup {
            color_overrides = {
                all = {
                    text = "#e8c1f1",
                },
            },
            transparent_background = true,
        }
        vim.opt.termguicolors = true
        vim.cmd.colorscheme('catppuccin')
    end
}
