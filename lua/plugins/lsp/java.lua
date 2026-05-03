local function jdtls_config()
	local mason_jdtls = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
	local launcher = vim.fn.glob(mason_jdtls .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	local config_dir = mason_jdtls .. "/config_linux"
	local lombok = mason_jdtls .. "/lombok.jar"

	local java_home = os.getenv("JAVA_HOME") or (os.getenv("HOME") .. "/.sdkman/candidates/java/current")

	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

	return {
		cmd = {
			java_home .. "/bin/java",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.level=ALL",
			"-Xmx1G",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",
			"-jar",
			launcher,
			"-configuration",
			config_dir,
			"-data",
			workspace,
		},
		root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
		settings = {
			java = {
				configuration = {
					runtimes = {
						{ name = "JavaSE-25", path = java_home },
					},
				},
			},
		},
		-- lombok support
		init_options = {
			jvm_args = { "-javaagent:" .. lombok },
		},
	}
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("jdtls").start_or_attach(jdtls_config())
	end,
})

return {
	jdtls = {},
}
