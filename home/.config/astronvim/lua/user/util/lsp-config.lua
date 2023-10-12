local api = vim.api

local M = {}

function M.custom_attach(client, bufnr)
	-- Mappings.
	local map = function(mode, l, r, opts)
		opts = opts or {}
		opts.silent = true
		opts.buffer = bufnr
		opts.noremap = true
		vim.keymap.set(mode, l, r, opts)
	end

	map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
	map("n", "<C-]>", vim.lsp.buf.definition)

	map("n", "K", vim.lsp.buf.hover)
	map("n", "<C-k>", vim.lsp.buf.signature_help)
	map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "variable rename" })
	map("n", "gr", vim.lsp.buf.references, { desc = "show references" })

	map("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
	map("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })

	map("n", "<leader>q", function()
		vim.diagnostic.setqflist({ open = true })
	end, { desc = "put diagnostic to qf" })

	map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
	map("n", "<leader>wl", function()
		vim.inspect(vim.lsp.buf.list_workspace_folders())
	end, { desc = "list workspace folder" })

	-- Set some key bindings conditional on server capabilities
	if client.server_capabilities.documentFormattingProvider then
		map(
			"n",
			"<leader>f",
			vim.lsp.buf.format({
				timeout_ms = 2000,
				bufnr = bufnr,
				filter = function(client)
					return client.name == "null-ls"
				end,
			}),
			{ desc = "format code" }
		)
	end

	api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local float_opts = {
				focusable = false,
				close_events = {
					"BufLeave",
					"CursorMoved",
					"InsertEnter",
					"FocusLost",
				},
				border = "rounded",
				source = "always", -- show source in diagnostic popup window
				prefix = " ",
			}

			if not vim.b.diagnostics_pos then
				vim.b.diagnostics_pos = { nil, nil }
			end

			local cursor_pos = api.nvim_win_get_cursor(0)
			if
				(cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
				and #vim.diagnostic.get() > 0
			then
				vim.diagnostic.open_float(nil, float_opts)
			end

			vim.b.diagnostics_pos = cursor_pos
		end,
	})

	-- The blow command will highlight the current variable and its usages in the buffer.
	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
	end

	if vim.g.logging_level == "debug" then
		local msg = string.format("Language server %s started!", client.name)
		vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
	end
end

return M
