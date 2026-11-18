-- Go editing helpers

-- GoLand-style return type wrapping: typing "," right after a single,
-- unparenthesized return type wraps it in parens, e.g.
--   func foo() string|   + ","  ->  func foo() (string, |)
local func_types = {
	function_declaration = true,
	method_declaration = true,
	func_literal = true,
	function_type = true,
	method_elem = true,
}

local function wrap_return_type_on_comma(buf)
	vim.keymap.set("i", ",", function()
		local function plain_comma()
			vim.api.nvim_feedkeys(",", "ni", false)
		end

		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		if col == 0 then
			return plain_comma()
		end

		local ok, node = pcall(function()
			vim.treesitter.get_parser(buf):parse({ row - 1, row })
			return vim.treesitter.get_node({ bufnr = buf, pos = { row - 1, col - 1 } })
		end)
		if not ok then
			return plain_comma()
		end

		while node and node:parent() do
			local parent = node:parent()
			if func_types[parent:type()] then
				local result = parent:field("result")[1]
				if result and result:id() == node:id() and node:type() ~= "parameter_list" then
					local sr, sc, er, ec = node:range()
					if er == row - 1 and ec == col then
						vim.api.nvim_buf_set_text(buf, row - 1, col, row - 1, col, { ", )" })
						vim.api.nvim_buf_set_text(buf, sr, sc, sr, sc, { "(" })
						vim.api.nvim_win_set_cursor(0, { row, col + 3 })
						return
					end
				end
				break
			end
			node = parent
		end

		plain_comma()
	end, { buffer = buf, desc = "Go: wrap return type in parens on ," })
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	group = vim.api.nvim_create_augroup("go-return-parens", { clear = true }),
	callback = function(args)
		wrap_return_type_on_comma(args.buf)
	end,
})
