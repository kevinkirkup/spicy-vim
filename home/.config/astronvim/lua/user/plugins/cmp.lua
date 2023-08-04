-- Setup nvim-cmp.
return {
	-- Snippets
	{ "SirVer/ultisnips",   event = "InsertEnter" },
	{ "honza/vim-snippets", dependencies = { "SirVer/ultisnips" } },
	{
		"quangnguyen30192/cmp-nvim-ultisnips",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"SirVer/ultisnips",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{ "hrsh7th/cmp-cmdline", dependencies = { "hrsh7th/nvim-cmp" } },
	{ "hrsh7th/cmp-emoji",   dependencies = { "hrsh7th/nvim-cmp" } },
	{
		"hrsh7th/nvim-cmp",
		-- commit = "a9c701fa7e12e9257b3162000e5288a75d280c28", -- https://github.com/hrsh7th/nvim-cmp/issues/1382
		dependencies = {
			"quangnguyen30192/cmp-nvim-ultisnips",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		},
		event = "InsertEnter",
		opts = function()
			local cmp = require("cmp")
			local lspkind_status_ok, lspkind = pcall(require, "lspkind")
			local border_opts = {
				border = "single",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
			}

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
				}),
				sources = {
					{ name = "nvim_lsp" },              -- For nvim-lsp
					{ name = "ultisnips" },             -- For ultisnips user.
					{ name = "path" },                  -- for path completion
					{ name = "buffer",   keyword_length = 2 }, -- for buffer word completion
					{ name = "omni" },
					{ name = "emoji",    insert = true }, -- emoji completion
				},
				completion = { keyword_length = 1, completeopt = "menu,noselect" },
				view = { entries = "custom" },
			}
		end,
	},
}
