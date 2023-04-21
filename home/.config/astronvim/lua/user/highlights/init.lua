-- this is for diagnostics signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = "E", Warn = "W", Hint = " ", Info = "I" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {
	-- highlight! link CmpItemMenu Comment
	--  gray
	-- CmpItemAbbrDeprecated = {
	-- 	guibg = NONE,
	-- 	gui = strikethrough,
	-- 	guifg = "#808080"
	-- },
	-- -- blue
	-- CmpItemAbbrMatch = { guibg = NONE, guifg = "#569CD6" },
	-- CmpItemAbbrMatchFuzzy = { guibg = NONE, guifg = "#569CD6" },
	-- -- light blue
	-- CmpItemKindVariable = { guibg = NONE, guifg = "#9CDCFE" },
	-- CmpItemKindInterface = { guibg = NONE, guifg = "#9CDCFE" },
	-- CmpItemKindText = { guibg = NONE, guifg = "#9CDCFE" },
	-- -- pink
	-- CmpItemKindFunction = { guibg = NONE, guifg = "#C586C0" },
	-- CmpItemKindMethod = { guibg = NONE, guifg = "#C586C0" },
	-- -- front
	-- CmpItemKindKeyword = { guibg = NONE, guifg = "#D4D4D4" },
	-- CmpItemKindProperty = { guibg = NONE, guifg = "#D4D4D4" },
	-- CmpItemKindUnit = { guibg = NONE, guifg = "#D4D4D4" }
}
