return {
	filetypes = { "yaml" },
	settings = {
		ansible = {
			ansible = {
				path = "ansible",
				useFullyQualifiedCollectionNames = true,
			},
			ansibleLint = {
				enabled = true,
				path = "ansible-lint",
			},
			executionEnvironment = {
				enabled = false,
			},
			python = {
				interpreterPath = "python",
			},
			completion = {
				provideRedirectModules = true,
				provideModuleOptionAliases = true,
			},
		},
	},
}
