-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- themes --
  use 'folke/tokyonight.nvim'

  -- telescope --
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
 -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
 -- bruxisma fixup https://github.com/nvim-telescope/telescope-fzf-native.nvim/pull/78
 -- This branch/PR fixes the windows make. When not working remove the above comment
  use {'bruxisma/telescope-fzf-native.nvim', run = 'make' , branch = 'bruxisma/fixup-cmake'}

  -- tree-sitter --
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP --
  use 'neovim/nvim-lspconfig'

  -- SURROUND --
  use 'tpope/vim-surround'

  -- COMMENT --
  use 'numToStr/Comment.nvim'

  -- Completion --
  use "hrsh7th/nvim-cmp"          -- Completion engine
  use "L3MON4D3/LuaSnip"          -- Snippet engine (required for nvim-cmp)
  use "saadparwaiz1/cmp_luasnip"  -- Snipper completion source
  use "hrsh7th/cmp-buffer"        -- Buffer completion source
  use "hrsh7th/cmp-nvim-lsp"      -- LSP completion source

end)
