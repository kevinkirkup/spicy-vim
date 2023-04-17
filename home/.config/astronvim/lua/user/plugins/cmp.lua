-- Setup nvim-cmp.
--  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu

return {
	-- Snippets
	{
		"SirVer/ultisnips",
		event = "InsertEnter",
		lazy = false,
	},
	{
		"honza/vim-snippets",
		dependencies = { "ultisnips" },
		lazy = false,
	},
	{
		"quangnguyen30192/cmp-nvim-ultisnips",
		dependencies = { "nvim-cmp", "ultisnips" },
		lazy = false,
	},
	{ "hrsh7th/cmp-cmdline", dependencies = { "nvim-cmp" }, lazy = false },
	{ "hrsh7th/cmp-emoji", dependencies = { "nvim-cmp" }, lazy = false },
	{
		"hrsh7th/nvim-cmp",
		commit = "a9c701fa7e12e9257b3162000e5288a75d280c28", -- https://github.com/hrsh7th/nvim-cmp/issues/1382
		lazy = false,
		dependencies = {
			"quangnguyen30192/cmp-nvim-ultisnips",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		},
		event = "InsertEnter",
		opts = function()
			vim.cmd([[
        highlight! link CmpItemMenu Comment
        " gray
        highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
        " blue
        highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
        highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
        " light blue
        highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
        highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
        " pink
        highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
        highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
        " front
        highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
        highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
      ]])

			local cmp = require("cmp")
			local snip_status_ok, ultisnips = pcall(require, "ultisnips")
			local lspkind_status_ok, lspkind = pcall(require, "lspkind")
			if not snip_status_ok then
				return
			end
			local border_opts = {
				border = "single",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			}

			local function has_words_before()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			return {
				enabled = function()
					if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then
						return false
					end
					return vim.g.cmp_enabled
				end,
				preselect = cmp.PreselectMode.None,
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = lspkind_status_ok and lspkind.cmp_format(astronvim.lspkind) or nil,
				},
				snippet = {
					expand = function(args)
						-- For `ultisnips` user.
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				duplicates = {
					nvim_lsp = 1,
					utlisnips = 1,
					cmp_tabnine = 1,
					buffer = 1,
					path = 1,
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				window = {
					completion = cmp.config.window.bordered(border_opts),
					documentation = cmp.config.window.bordered(border_opts),
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<Esc>"] = cmp.mapping.close(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),
				sources = {
					{ name = "nvim_lsp" }, -- For nvim-lsp
					{ name = "ultisnips" }, -- For ultisnips user.
					{ name = "path" }, -- for path completion
					{ name = "buffer", keyword_length = 2 }, -- for buffer word completion
					{ name = "omni" },
					{ name = "emoji", insert = true }, -- emoji completion
				},
				completion = {
					keyword_length = 1,
					completeopt = "menu,noselect",
				},
				view = {
					entries = "custom",
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						menu = {
							nvim_lsp = "[LSP]",
							ultisnips = "[US]",
							nvim_lua = "[Lua]",
							path = "[Path]",
							buffer = "[Buffer]",
							emoji = "[Emoji]",
							omni = "[Omni]",
						},
					}),
				},
			}
		end,
	},
}
