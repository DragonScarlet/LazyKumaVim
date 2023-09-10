local keymap = vim.keymap.set
local command = vim.api.nvim_create_user_command

vim.g.mapleader = " "
keymap("n", "<leader>pv", vim.cmd.Ex)

-- Exit
command('Qq', 'q! | q! | q!', {})

-- Autoformat
keymap("v", "<leader>f", ":'<, '> lua vim.lsp.buf.format() <CR>")
keymap("n", "<leader>ff", ":lua vim.lsp.buf.format() <CR>")


-- nvim-tree
keymap("n", "<leader>pt", "<cmd>NvimTreeToggle<CR>")

-- Git
keymap("n", "<leader>gs", vim.cmd.Git)

-- Dap
keymap("n", "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>")
keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
