return {
	"Yggdroot/LeaderF",
	cmd = "Leaderf",
	build = ":LeaderfInstallCExtension",
	keys = {
		{ "<leader>ff", ":Leaderf! file<CR>",             desc = "Find File" },
		{ "<leader>fu", ":Leaderf! function --fuzzy<CR>", desc = "Find Function" },
		{ "<leader>fb", ":Leaderf! buffer<CR>",           desc = "Find Buffer" },
		{ "<leader>fg", ":Leaderf! rg -F<CR>",            desc = "" },
		-- keymap.set("n", "<leader>fw", "printf(':Leaderf! rg -e %s ', \"" .. vim.fn.expand("<cword>") .. "\")<CR>", {
		--   expr = true,
		--   desc = "Search for current word."
		-- })

		-- search visually selected text literally
		-- keymap.set("n", "gf", ":printf('Leaderf! rg -F -e %s ', " .. vim.fn.LeaderFRgVisual() .. ")<CR>", {
		--   expr = true,
		--   desc = "Search for visual selection."
		-- })
		-- keymap.set("n", "go", ":Leaderf! rg --recall<CR>")
	},
}
