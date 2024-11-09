return {
  { "goolord/alpha-nvim", config = require "muskuloes.plugins.configs.alpha" },

  { "windwp/nvim-autopairs", opts = require "muskuloes.plugins.configs.autopairs" },

  { "windwp/nvim-ts-autotag", config = require "muskuloes.plugins.configs.autotag" },

  { "akinsho/bufferline.nvim", config = require "muskuloes.plugins.configs.bufferline" },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
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
    config = require "muskuloes.plugins.configs.cmp",
  },

  { "R-nvim/cmp-r", config = require "muskuloes.plugins.configs.cmp_r" },

  { "numToStr/Comment.nvim", config = require "muskuloes.plugins.configs.comment" },

  { "sindrets/diffview.nvim" },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup {}
    end,
  },

  "rafamadriz/friendly-snippets",

  { "lewis6991/gitsigns.nvim", config = require "muskuloes.plugins.configs.gitsigns" },

  "ellisonleao/glow.nvim",

  -- Colorscheme
  { "gruvbox-community/gruvbox" },

  "lewis6991/impatient.nvim",

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = require "muskuloes.plugins.configs.lsp",
  },

  -- Status and tab line
  {
    "nvim-lualine/lualine.nvim",
    config = require "muskuloes.plugins.configs.lualine",
  },

  { "L3MON4D3/LuaSnip", dependencies = { "saadparwaiz1/cmp_luasnip" } },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = require "muskuloes.plugins.configs.null_ls",
  },

  { "kyazdani42/nvim-tree.lua", config = require "muskuloes.plugins.configs.nvim_tree" },

  "kyazdani42/nvim-web-devicons",

  "JoosepAlviste/nvim-ts-context-commentstring",

  "nvim-treesitter/playground",

  "nvim-lua/plenary.nvim",

  { "quarto-dev/quarto-nvim", dependencies = { "jmbuhr/otter.nvim" }, config = require "muskuloes.plugins.configs.quarto_nvim" },

  { "R-nvim/R.nvim", config = require "muskuloes.plugins.configs.r" },

  { "michaelb/sniprun", build = "bash ./install.sh", config = require "muskuloes.plugins.configs.sniprun" },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = require "muskuloes.plugins.configs.telescope",
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = require "muskuloes.plugins.configs.treesitter" },

  { "folke/trouble.nvim", config = require "muskuloes.plugins.configs.trouble" },

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },

  --install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
