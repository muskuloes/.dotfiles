local function packer_use(use)
  use "wbthomason/packer.nvim"

  use "lewis6991/impatient.nvim"

  use { "akinsho/bufferline.nvim", config = require "muskuloes.plugins.bufferline" }

  use { "kyazdani42/nvim-tree.lua", config = require "muskuloes.plugins.nvim_tree" }

  -- Colorscheme
  use { "gruvbox-community/gruvbox" }

  use { "windwp/nvim-autopairs", config = require "muskuloes.plugins.autopairs" }
  use { "windwp/nvim-ts-autotag", config = require "muskuloes.plugins.autotag" }

  use { "folke/trouble.nvim", config = require "muskuloes.plugins.trouble" }

  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  }
  use { "numToStr/Comment.nvim", config = require "muskuloes.plugins.comment" }

  use { "lewis6991/gitsigns.nvim", config = require "muskuloes.plugins.gitsigns" }

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require "muskuloes.plugins.treesitter" }

  use "nvim-treesitter/playground"

  use "JoosepAlviste/nvim-ts-context-commentstring"

  use "ellisonleao/glow.nvim"

  use "kyazdani42/nvim-web-devicons"

  use "nvim-lua/plenary.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = require "muskuloes.plugins.telescope",
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = require "muskuloes.plugins.lsp",
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
    },
    config = require "muskuloes.plugins.cmp",
  }

  -- Snippets
  use { "L3MON4D3/LuaSnip", requires = { "saadparwaiz1/cmp_luasnip" } }

  use "rafamadriz/friendly-snippets"

  use { "goolord/alpha-nvim", config = require "muskuloes.plugins.alpha" }

  -- Status and tab line
  use {
    "nvim-lualine/lualine.nvim",
    config = require "muskuloes.plugins.lualine",
  }

  use { "sindrets/diffview.nvim" }

  -- Automatically set up config after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.notify "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the init.lua file
local packer_augroup = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = packer_augroup,
  pattern = { "**/nvim/**/plugins/init.lua" },
  command = "source <afile> | PackerSync",
})

local ok, packer = pcall(require, "packer")

if not ok then
  return
end

return packer.startup(packer_use)
