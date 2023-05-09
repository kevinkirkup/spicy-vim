-- Manage your yank history
return {
	"svermeulen/vim-yoink",
	lazy = false,
	keys = {
		{ "cy", ":ClearYanks<CR>",                         desc = "Clear Yanks" },
		-- Rotate through stored yanks
		{ "[Y", "<plug>(YoinkRotateBack)",                 desc = "Yoink Rotate Back" },
		{ "]Y", "<plug>(YoinkRotateForward)",              desc = "Yoink Rotate Forward" },
		-- Rotate through pasted yank
		{ "[y", "<plug>(YoinkPostPasteSwapBack)",          desc = "Yoink Swap Back" },
		{ "]y", "<plug>(YoinkPostPasteSwapForward)",       desc = "Yoink Swap Forward" },

		-- Cursor Position
		{ "y",  "<plug>(YoinkYankPreserveCursorPosition)", desc = "Preserve Cursor Position", mode = { "n", "x" } },

		-- Pasting
		{ "p",  "<plug>(YoinkPaste_p)",                    desc = "Paste After" },
		{ "P",  "<plug>(YoinkPaste_P)",                    desc = "Paste Before" },

		-- Also replace the default gp with yoink paste so we can toggle paste in this case too
		{ "gp", "<plug>(YoinkPaste_gp)",                   desc = "Pate Register" },
		{ "gP", "<plug>(YoinkPaste_gP)",                   desc = "Paste Register Before" },
	},
}
