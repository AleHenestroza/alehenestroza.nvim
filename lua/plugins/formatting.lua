require("guess-indent").setup({})

require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		local disable_filetypes = {
			c = true,
			cpp = true,
		}

		if disable_filetypes[vim.bo[bufnr].filetype] then
			return nil
		end

		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		-- goimports fixes imports, then gopls formats (keeps its gofumpt style)
		go = { "goimports", lsp_format = "last" },
		markdown = { "markdownlint" },
	},
	formatters = {
		markdownlint = {
			command = "markdownlint",
			args = { "--fix", "$FILENAME" },
			stdin = false,
		},
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "[F]ormat buffer" })
