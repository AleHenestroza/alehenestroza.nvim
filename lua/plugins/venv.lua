require("venv-selector").setup()

vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "[V]env [S]elect" })
vim.keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "[V]env [C]ached" })
