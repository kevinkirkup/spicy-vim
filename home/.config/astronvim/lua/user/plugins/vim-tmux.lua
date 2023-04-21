local utils = require("user.util.misc")

if utils.executable("tmux") then
	-- .tmux.conf syntax highlighting and setting check
	return { "tmux-plugins/vim-tmux", ft = { "tmux" } }
else
	return {}
end
