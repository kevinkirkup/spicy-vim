-- notification plugin
return {
	"rcarriga/nvim-notify",
	event = "BufEnter",
	opts = {
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 1000 })
		end,
		-- Animation style
		stages = "fade_in_slide_out",
		-- Default timeout for notifications
		timeout = 1500,
		background_colour = "#2E3440",
	},
}
