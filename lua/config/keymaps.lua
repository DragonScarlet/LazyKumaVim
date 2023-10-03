local keymap = vim.keymap.set
local command = vim.api.nvim_create_user_command

vim.g.mapleader = " "

-- Exit
command('Qq', 'q! | q! | q!', {})

-- Autoformat
keymap("v", "<leader>f", ":'<, '> lua vim.lsp.buf.format() <CR>", { desc = "Format selection" })
keymap("n", "<leader>ff", ":lua vim.lsp.buf.format() <CR>", { desc = "File Format" })

-- File
keymap("n", "<leader>fc", ":%yank +<CR>", { desc = "File Copy" })
keymap("n", "<leader>fp", ":%delete | put +<CR>", { desc = "File Paste" })

-- nvim-tree
keymap("n", "<leader>pt", "<cmd>NvimTreeToggle<CR>", { desc = "Project Tree" })

-- Git
keymap("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
keymap('n', '<leader>gr', ":2,$s/pick/s<CR>", { desc = "Git Replace (Pick with S)" })

-- Java
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
keymap('n', '<leader>cD', vim.lsp.buf.declaration, { desc = "Go to Declaration" })
keymap('n', '<leader>cd', vim.lsp.buf.definition, { desc = "Go to definition" })
keymap('n', '<leader>ci', vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap('n', '<leader>ch', vim.lsp.buf.hover, { desc = "Hover" })
keymap('n', '<leader>cs', vim.lsp.buf.signature_help, { desc = "Signature" })

-- Dap
keymap("n", "<leader>tc", "<Cmd>lua require'jdtls'.test_class()<CR>", { desc = "Test Class" })
keymap("n", "<leader>tf", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { desc = "Test Function" })
