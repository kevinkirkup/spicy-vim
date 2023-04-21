-- Show match number and index for searching
if false then
	return {
		"kevinhwang91/nvim-hlslens",
		branch = "main",
		event = { "User AstroFile" },
		keys = {
			{
				"n",
				"",
				callback = function()
					local cmd = string.format("normal! %s%szzzv", vim.v.count1, "n")
					local status, msg = pcall(vim.cmd, cmd)

					if not status then
						-- 13 is the index where real error message starts
						msg = msg:sub(13)
						vim.api.nvim_err_writeln(msg)
						return
					end

					require("hlslens").start()
				end,
				noremap = true,
				silent = true,
			},
			{
				"N",
				"",
				callback = function()
					local cmd = string.format("normal! %s%szzzv", vim.v.count1, "N")
					local status, msg = pcall(vim.cmd, cmd)

					if not status then
						-- 13 is the index where real error message starts
						msg = msg:sub(13)
						vim.api.nvim_err_writeln(msg)
						return
					end

					require("hlslens").start()
				end,
				noremap = true,
				silent = true,
			},
			{
				"*",
				"",
				callback = function()
					vim.fn.execute("normal! *N")
					require("hlslens").start()
				end,
				noremap = true,
				silent = true,
			},
			{
				"#",
				"",
				callback = function()
					vim.fn.execute("normal! #N")
					require("hlslens").start()
				end,
			},
			{
				"<Leader>l",
				"<Cmd>noh<CR>",
				desc = "Expand hlslens",
				noremap = true,
				silent = true,
			},
		},
		opts = {
			calm_down = true,
			nearest_only = true,
			override_lens = function(render, posList, nearest, idx, relIdx)
				local sfw = vim.v.searchforward == 1
				local indicator, text, chunks
				local absRelIdx = math.abs(relIdx)
				if absRelIdx > 1 then
					indicator = ("%d%s"):format(absRelIdx, sfw ~= (relIdx > 1) and "▲" or "▼")
				elseif absRelIdx == 1 then
					indicator = sfw ~= (relIdx == 1) and "▲" or "▼"
				else
					indicator = ""
				end

				local lnum, col = unpack(posList[idx])
				if nearest then
					local cnt = #posList
					if indicator ~= "" then
						text = ("[%s %d/%d]"):format(indicator, idx, cnt)
					else
						text = ("[%d/%d]"):format(idx, cnt)
					end
					chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
				else
					text = ("[%s %d]"):format(indicator, idx)
					chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
				end
				render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
			end,
		},
	}
else
	return {}
end
