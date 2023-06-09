return {
	settings = {
		yaml = {
			validate = { enable = true },
			format = { enable = false },
			schemaStore = { enable = false },
			keyOrdering = false,
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
}
