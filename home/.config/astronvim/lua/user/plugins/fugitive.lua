-- Git command inside vim
return {
  "tpope/vim-fugitive",
  event = "User InGitRepo",
  config = function() require('user.plugins.configs.fugitive') end
}
