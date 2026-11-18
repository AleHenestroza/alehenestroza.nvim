-- JetBrains' official Kotlin LSP (pre-alpha); root_markers come from nvim-lspconfig.
-- Mason's kotlin-lsp package now ships the binary as `intellij-server`
-- (lspconfig still expects `kotlin-lsp`), so override cmd.
return {
	kotlin_lsp = {
		cmd = { "intellij-server", "--stdio" },
	},
}
