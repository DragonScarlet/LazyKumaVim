return {
    'mfussenegger/nvim-jdtls',
    config = function()
        local home = os.getenv('HOME')
        local config = {
            cmd = { home .. '.local/share/nvim/mason/packages/jdtls/bin/jdtls' },
            root_dir = vim.fs.dirname(vim.fs.find({ '.pom', 'mvnw' }, { upward = true })[1]),
        }
        require('jdtls').start_or_attach(config)
    end
}
