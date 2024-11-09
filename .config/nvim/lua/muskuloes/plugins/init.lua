local function packer_use(use)
  use { "goolord/alpha-nvim", config = require "muskuloes.plugins.alpha" }

  use { "windwp/nvim-autopairs", config = require "muskuloes.plugins.autopairs" }

  use { "windwp/nvim-ts-autotag", config = require "muskuloes.plugins.autotag" }

  use { "akinsho/bufferline.nvim", config = require "muskuloes.plugins.bufferline" }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "jc-doyle/cmp-pandoc-references",
      "kdheepak/cmp-latex-symbols",
      "onsails/lspkind-nvim",
    },
    config = require "muskuloes.plugins.cmp",
  }

  use { "R-nvim/cmp-r", config = require "muskuloes.plugins.cmp_r" }

  use { "numToStr/Comment.nvim", config = require "muskuloes.plugins.comment" }

  use { "sindrets/diffview.nvim" }

  use {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup {}
    end,
  }

  use "rafamadriz/friendly-snippets"

  use { "lewis6991/gitsigns.nvim", config = require "muskuloes.plugins.gitsigns" }

  use "ellisonleao/glow.nvim"

  -- Colorscheme
  use { "gruvbox-community/gruvbox" }

  use "lewis6991/impatient.nvim"

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = require "muskuloes.plugins.lsp",
  }

  -- Status and tab line
  use {
    "nvim-lualine/lualine.nvim",
    config = require "muskuloes.plugins.lualine",
  }

  use { "L3MON4D3/LuaSnip", requires = { "saadparwaiz1/cmp_luasnip" } }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = require "muskuloes.plugins.null_ls",
  }

  use { "kyazdani42/nvim-tree.lua", config = require "muskuloes.plugins.nvim_tree" }

  use "kyazdani42/nvim-web-devicons"

  use "JoosepAlviste/nvim-ts-context-commentstring"

  use "wbthomason/packer.nvim"

  use "nvim-treesitter/playground"

  use "nvim-lua/plenary.nvim"

  use { "quarto-dev/quarto-nvim", requires = { "jmbuhr/otter.nvim" }, config = require "muskuloes.plugins.quarto_nvim" }

  use { "R-nvim/R.nvim", config = require "muskuloes.plugins.r" }

  use { "michaelb/sniprun", run = "bash ./install.sh", config = require "muskuloes.plugins.sniprun" }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = require "muskuloes.plugins.telescope",
  }

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = require "muskuloes.plugins.treesitter" }

  use { "folke/trouble.nvim", config = require "muskuloes.plugins.trouble" }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  }

  --install without yarn or npm
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }

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
