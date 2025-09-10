
local opts = { noremap = true, silent = true }


-- ==============================
-- General navigation
-- ==============================
vim.keymap.set("n", "<M-Left>", "b", opts)   -- ir para início da palavra anterior
vim.keymap.set("n", "<M-Right>", "w", opts)  -- ir para início da próxima palavra
vim.keymap.set("i", "<M-Left>", "<C-Left>", opts)
vim.keymap.set("i", "<M-Right>", "<C-Right>", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)  -- mover entre splits
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
