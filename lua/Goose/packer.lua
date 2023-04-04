-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- THEMES --
  use 'folke/tokyonight.nvim'

  -- TELESCOPE --
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  --use choco install make or have msys2 make. Must have make in path
  --else, use cmake and verify if build with cmake was successful. The command below alreay gave me problems
  --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- TREESITTER --
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP --
  use 'neovim/nvim-lspconfig'

  -- MASON --
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}

  -- SURROUND --
  use 'tpope/vim-surround'

  -- COMMENT --
  use 'numToStr/Comment.nvim'

  -- COMPLETION --
  use "hrsh7th/nvim-cmp"          -- Completion engine
  use "L3MON4D3/LuaSnip"          -- Snippet engine (required for nvim-cmp)
  use "saadparwaiz1/cmp_luasnip"  -- Snipper completion source
  use "hrsh7th/cmp-buffer"        -- Buffer completion source
  use "hrsh7th/cmp-nvim-lsp"      -- LSP completion source

  -- TERMINAL --
  use "numToStr/FTerm.nvim"

  -- STATUS LINE --
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons'}
  }

  -- FILE TREE --
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  --
  -- TAB BAR -- 
  use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- WORKSPACES --
  use "natecraddock/workspaces.nvim"
  use({
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
          require("persistence").setup()
      end,
  })

  -- DEBUG --
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { "theHamsta/nvim-dap-virtual-text", requires = {"mfussenegger/nvim-dap"} }
  use { "nvim-telescope/telescope-dap.nvim", requires = {"mfussenegger/nvim-dap"} }
end)
