local keymap = vim.keymap.set
local command = vim.api.nvim_create_user_command

vim.g.mapleader = " "

-- Exit
command('Qq', 'q! | q! | q!', {})

-- Autoformat
keymap("v", "<leader>f", ":'<, '> lua vim.lsp.buf.format() <CR>", { desc = "Format selection" })
keymap("n", "<leader>ff", ":lua vim.lsp.buf.format() <CR>", { desc = "File Format" })


-- nvim-tree
keymap("n", "<leader>pt", "<cmd>NvimTreeToggle<CR>", { desc = "Project Tree" })

-- Git
keymap("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
keymap('n', '<leader>gr', ":2,$s/pick/s<CR>", { desc = "Git Replace (Pick with S)" })




-- Dap
keymap("n", "<leader>tc", "<Cmd>lua require'jdtls'.test_class()<CR>", { desc = "Test Class" })
keymap("n", "<leader>tf", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { desc = "Test Function" })
