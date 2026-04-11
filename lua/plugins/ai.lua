require("claudecode").setup({})

-- Grupo (solo descriptivo, útil para which-key)
vim.keymap.set("n", "<leader>a", function() end, {
	desc = "AI/Claude Code",
})

-- Base
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", {
	desc = "Toggle Claude",
	silent = true,
})

vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<CR>", {
	desc = "Focus Claude",
	silent = true,
})

vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<CR>", {
	desc = "Resume Claude",
	silent = true,
})

vim.keymap.set("n", "<leader>aC", "<cmd>ClaudeCode --continue<CR>", {
	desc = "Continue Claude",
	silent = true,
})

vim.keymap.set("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<CR>", {
	desc = "Select Claude model",
	silent = true,
})

vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<CR>", {
	desc = "Add current buffer",
	silent = true,
})

vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<CR>", {
	desc = "Send to Claude",
	silent = true,
})

-- File explorers (neo-tree, etc)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
	callback = function(event)
		vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<CR>", {
			buffer = event.buf,
			desc = "Add file",
			silent = true,
		})
	end,
})

-- Diff management
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", {
	desc = "Accept diff",
	silent = true,
})

vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", {
	desc = "Deny diff",
	silent = true,
})
