local lint = require("lint")

lint.linters_by_ft = {
	markdown = { "markdownlint" },
	go = { "golangcilint" },
	kotlin = { "ktlint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- golangcilint operates on saved files, so only run after write to avoid
-- phantom errors from linting stale disk content mid-edit
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = lint_augroup,
	pattern = { "*.go" },
	callback = function()
		if vim.bo.modifiable then
			lint.try_lint()
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	pattern = { "*.md", "*.kt", "*.kts" },
	callback = function()
		if vim.bo.modifiable then
			lint.try_lint()
		end
	end,
})

vim.keymap.set("n", "<leader>cl", function()
	require("lint").try_lint()
end, { desc = "[C]ode [L]int current buffer" })
