return function(_, opts)
	require("indent_blankline").setup(opts)

	vim.opt.list = true
	vim.cmd([[highlight IndentBlanklineIndent guifg=#353535 gui=nocombine]])

	local api = vim.api

	local gid = api.nvim_create_augroup("indent_blankline", { clear = true })
	api.nvim_create_autocmd("InsertEnter", {
		pattern = "*",
		group = gid,
		command = "IndentBlanklineDisable",
	})

	local filetype_exclude = {
		"help",
		"alpha",
		"dashboard",
		"neo-tree",
		"checkhealth",
		"packer",
		"lspinfo",
		"git",
		"gitconfig",
		"markdown",
		"snippets",
		"text",
	}

	api.nvim_create_autocmd("InsertLeave", {
		pattern = "*",
		group = gid,
		callback = function()
			if not vim.tbl_contains(filetype_exclude, vim.bo.filetype) then
				vim.cmd([[IndentBlanklineEnable]])
			end
		end,
	})
end
