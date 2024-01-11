return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "     竜-スカーレット     ",
            "          ,.  ,.         ",
            "          ||  ||         ",
            "         ,''--''.        ",
            "        :-(=)(=)-:       ",
            "      V,'        `.V     ",
            "       :          :      ",
            "       :          :      ",
            " -ctr- `._m____m_,'      ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("p", "   Open Project", ":ene <BAR> NvimTreeToggle <CR>"),
            dashboard.button("n", "   Notes", ":e $HOME/notes/TODOS.txt <BAR> NvimTreeToggle <CR>"),
            dashboard.button("g", "   Game", ":VimBeGood<CR>"),
            dashboard.button("s", "   Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button("q", "   Quit", ":qa<CR>"),
        }

        -- Set footer
        --   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
        --   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
        --   ```init.lua
        --   return require('packer').startup(function()
        --       use 'wbthomason/packer.nvim'
        --       use {
        --           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
        --           requires = {'BlakeJC94/alpha-nvim-fortune'},
        --           config = function() require("config.alpha") end
        --       }
        --   end)
        --   ```
        -- local fortune = require("alpha.fortune")
        dashboard.section.footer.val = {
            "      --- 熊ビム ---     ",
        }


        -- Send config to alpha
        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "熊ビム loaded " .. stats.count .. " plugins in " .. ms .. "ms 速い!" 
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
        -- Disable folding on alpha buffer
        vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
    end
}
