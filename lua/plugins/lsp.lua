return {
    'VonHeikemen/lsp-zero.nvim',
    enabled = true,
    branch = 'v1.x',
    dependencies = {
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },         -- Required
        { 'hrsh7th/cmp-nvim-lsp' },     -- Required
        { 'hrsh7th/cmp-buffer' },       -- Optional
        { 'hrsh7th/cmp-path' },         -- Optional
        { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        { 'hrsh7th/cmp-nvim-lua' },     -- Optional

        -- Snippets
        { 'L3MON4D3/LuaSnip' },             -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset("recommended")
        lsp.ensure_installed({
            'tsserver',
            'eslint',
        })
        lsp.skip_server_setup({'jdtls'})
        -- (Optional) Configure lua language server for neovim
        lsp.nvim_workspace()

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = false,
            float = true,
        })

        -- You need to setup `cmp` after lsp-zero
        local cmp = require('cmp')
--        local lspkind = require('lspkind')

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = "codeium" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end
}
