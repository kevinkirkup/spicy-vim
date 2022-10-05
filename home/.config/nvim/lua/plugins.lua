local utils = require("utils")
local fn = vim.fn

----------------------------------------------------
-- Packet setup
----------------------------------------------------

-- The root dir to install all plugins.
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

-- Where to install packer.nvim -- the package manager (we make it opt)
local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

-- Whether this is a fresh install, i.e., packer itself and plugins have not been installed.
local fresh_install = false

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_dir) == "" then
  fresh_install = true

  -- Now we need to install packer.nvim first.
  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)

  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require("packer.util")


----------------------------------------------------
-- Plugins
----------------------------------------------------

packer.startup {
  function(use)
    -- it is recommended to put impatient.nvim before any other plugins
    use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }

    use { "wbthomason/packer.nvim", opt = true }

    use { "onsails/lspkind-nvim", event = "VimEnter" }
    -- auto-completion engine
    use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }

    -- Completion
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
    use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }
    if vim.g.is_mac then
      use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
    end

    -- LSP
    use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp']] }
    use { "dense-analysis/ale" }
    if vim.g.is_mac then
      use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufEnter",
        run = ":TSUpdate",
        config = [[require('config.treesitter')]],
      }
    end

    -- Super fast buffer jump
    use {
      "phaazon/hop.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function()
          require("config.nvim_hop")
        end, 2000)
      end,
    }

    -- Show match number and index for searching
    use {
      "kevinhwang91/nvim-hlslens",
      branch = "main",
      keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
      config = [[require('config.hlslens')]],
    }

    use { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" }

    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- search emoji and other symbols
    use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }

    -- Themes
    use { "wadackel/vim-dogrun", opt = true }
    use { "rakr/vim-one", opt = true }
    use { "hzchirs/vim-material", opt = true }
    use { "embark-theme/vim", opt = true }
    use { "drewtempelmeyer/palenight.vim", opt = true }
    use { "cocopon/iceberg.vim", opt = true }
    use { "fenetikm/falcon", opt = true }
    use { "jarodl/cobalt.vim", opt = true }
    use { "travisjeffery/vim-colors", opt = true }
    use { "arcticicestudio/nord-vim", opt = true }

    use { "kyazdani42/nvim-web-devicons", event = "VimEnter" }

    use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      config = [[require('config.statusline')]],
    }

    use { "akinsho/bufferline.nvim",
      event = "VimEnter",
      config = [[require('config.bufferline')]]
    }

    -- fancy start screen
    use { "glepnir/dashboard-nvim", event = "VimEnter",
      config = [[require('config.dashboard-nvim')]]
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "VimEnter",
      config = [[require('config.indent-blankline')]],
    }

    -- Highlight URLs inside vim
    use { "itchyny/vim-highlighturl", event = "VimEnter" }

    -- notification plugin
    use {
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function()
          require("config.nvim-notify")
        end, 2000)
      end,
    }

    -- open URL in browser
    use { "tyru/open-browser.vim", event = "VimEnter" }

    -- Snippet engine and snippet template
    use { "SirVer/ultisnips", event = "InsertEnter" }
    use { "honza/vim-snippets", after = "ultisnips" }

    -- Plug 'kevinkirkup/vim-snippets'

    -- Automatic insertion and deletion of a pair of characters
    use { "Raimondi/delimitMate", event = "InsertEnter" }

    -- Comment plugin
    use { "tpope/vim-commentary", event = "VimEnter" }

    -- Manage your yank history
    use { "svermeulen/vim-yoink", event = "VimEnter" }

    -- Auto format tools
    use { "sbdchd/neoformat", cmd = { "Neoformat" } }

    -- Git command inside vim
    use { "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('config.fugitive')]] }

    use { "kevinhwang91/nvim-bqf", ft = "qf", config = [[require('config.bqf')]] }

    -- Another markdown plugin
    use { "preservim/vim-markdown", ft = { "markdown" } }

    -- Faster footnote generation
    use { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } }

    -- Vim tabular plugin for manipulate tabular, required by markdown plugins
    use { "godlygeek/tabular", cmd = { "Tabularize" } }

    use { "folke/zen-mode.nvim", cmd = "ZenMode", config = [[require('config.zen-mode')]] }

    -- Additional powerful text object for vim, this plugin should be studied
    -- carefully to use its full power
    use { "wellle/targets.vim", event = "VimEnter" }

    -- Plugin to manipulate character pairs quickly
    use { "machakann/vim-sandwich", event = "VimEnter" }

    -- Add indent object for vim (useful for languages like Python)
    use { "michaeljsmith/vim-indent-object", event = "VimEnter" }

    if utils.executable("tmux") then
      -- .tmux.conf syntax highlighting and setting check
      use { "tmux-plugins/vim-tmux", ft = { "tmux" } }
    end

    -- Modern matchit implementation
    use { "andymass/vim-matchup", event = "VimEnter" }

    -- Smoothie motions
    use {
      "karb94/neoscroll.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function()
          require("config.neoscroll")
        end, 2000)
      end,
    }

    -- Asynchronous command execution
    use { "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" } }

    -- The missing auto-completion for cmdline!
    use { "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] }

    -- showing keybindings
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function()
          require("config.which-key")
        end, 2000)
      end,
    }

    -- show and trim trailing whitespaces
    use { "jdhao/whitespace.nvim", event = "VimEnter" }

    -- file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = [[require('config.nvim-tree')]],
    }
    -- use {
    --   "scrooloose/nerdtree",
    --   tag = '6.10.16'
    -- }

    use { "benmills/vimux", commit = "37f4119" }
    use { "vim-airline/vim-airline" }
    use { "vim-airline/vim-airline-themes" }
    use { "mileszs/ack.vim" }
    use { "junegunn/fzf" }
    use { "vim-scripts/VST" }
    use { "terryma/vim-multiple-cursors", tag = "v2.2" }

    -- Plug 'tpope/vim-fugitive', { 'tag': 'v3.7' }
    -- Plug 'Chiel92/vim-autoformat'
    -- Plug 'tpope/vim-endwise', { 'tag': 'v1.3' }
    -- Plug 'rizzatti/dash.vim'
    -- Plug 'ctrlpvim/ctrlp.vim'
    -- Plug 'ervandew/supertab'
    -- Plug 'wincent/command-t', { 'tag': '5.0.4' }

    -- Language Plugins
    use { "Rip-Rip/clang_complete", ft = { "c", "cpp" } }
    use { "cespare/vim-toml", ft = { "toml" }, branch = "main" }
    use { "ii14/emmylua-nvim", ft = "lua" }
    use { "j-hui/fidget.nvim", after = "nvim-lspconfig", config = [[require('config.fidget-nvim')]] }

    use { "keith/swift.vim", ft = "swift" }
    use { "simrat39/rust-tools.nvim", ft = "rust" }
    use { "hashivim/vim-terraform", ft = "terraform" }
    use { "manicmaniac/coconut.vim", ft = "coconut" }

    use { "fatih/vim-go", tag = "v1.26", ft = 'go' }
    use { "rhysd/vim-go-impl", ft = "go" }

    use { "mhinz/vim-mix-format", ft = "elixir" }
    use { "elixir-editors/vim-elixir", ft = "elixir" }

    use { "vim-erlang/vim-erlang-compiler", ft = "erlang" }
    use { "vim-erlang/vim-erlang-omnicomplete", ft = "erlang" }

    use { "vim-scripts/Vim-R-plugin", ft = "r" }
    use { "hspec/hspec", ft = "haskell" }

    use { "klen/python-mode", tag = "0.13.0", ft = 'python' }
    use { "sebdah/vim-delve", ft = "python" }

    use { "leafgarland/typescript-vim", ft = "typescript" }
    use { "pangloss/vim-javascript", commit = "e9a59c8", ft = 'javascript' }
    use { "heavenshell/vim-jsdoc", ft = "javascript" }

    use { "Glench/Vim-Jinja2-Syntax", ft = "jinja" }

  end,
  config = {
    max_jobs = 16,
    compile_path = packer_util.join_paths(fn.stdpath("data"), "site", "lua", "packer_compiled.lua"),
  },
}

-- For fresh install, we need to install plugins. Otherwise, we just need to require `packer_compiled.lua`.
if fresh_install then
  -- We run packer.sync() here, because only after packer.startup, can we know which plugins to install.
  -- So plugin installation should be done after the startup process.
  packer.sync()
else
  local status, _ = pcall(require, "packer_compiled")
  if not status then
    local msg = "File packer_compiled.lua not found: run PackerSync to fix!"
    vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
  end
end
