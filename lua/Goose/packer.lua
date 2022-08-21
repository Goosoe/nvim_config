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
  -- tree-sitter --
  use 'nvim-treesitter/nvim-treesitter'
  -- LSP --
  use '/neovim/nvim-lspconfig'

end)
