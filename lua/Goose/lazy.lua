local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
    --THEME
    --{
    --    "folke/tokyonight.nvim",
    --    lazy = false,
    --    priority = 1000,
    --    opts = {},
    --},
    --{
    --    --"rebelot/kanagawa.nvim",
    --},
    {
        "ellisonleao/gruvbox.nvim", priority = 1000
        --"rebelot/kanagawa.nvim",
    },
    -- Telescope (plus Extentions)
    -- Notes: install ripgrep and fd for live-grep support
    --use choco install make or have msys2 make. Must have make in path
    --else, use cmake and verify if build with cmake was successful. The command below alreay gave me problems
    --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        -- main = require('user.plugins.telescope'),
    },

      -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = function() require('nvim-treesitter.install').update({
                with_sync = true
            }) end,
        -- main = require('user.plugins.treesitter'),
    },
        -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        -- main = require('user.plugins.lsp'),
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",  -- Snipper completion source
            "hrsh7th/cmp-buffer",        -- Buffer completion source
            "hrsh7th/cmp-nvim-lsp",      -- LSP completion source
        },
        -- main = require('user.plugins.nvim-cmp'),
    },          -- Completion engine
    -- Snippet engine (required for nvim-cmp)
    {
        "L3MON4D3/LuaSnip",
        -- main = require('user.plugins.luasnip'),
    },
    "rafamadriz/friendly-snippets",

    --TERMINAL
    {
        "numToStr/FTerm.nvim"
    },
     -- Formatting / Linting
    {
        "mhartington/formatter.nvim",
        -- main = require('user.plugins.formatter'),
    },
    {
        "mfussenegger/nvim-lint",
        -- main = require('user.plugins.nvim-lint'),
    },
    -- Navigator
    {
    	"kyazdani42/nvim-tree.lua",
    		dependencies = {"kyazdani42/nvim-web-devicons"}, -- optional, for file icons
    },
    -- Workspace
    {
        "natecraddock/workspaces.nvim"
    },
    {'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            --'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
            opts = {
                -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
                -- animation = true,
                -- insert_at_start = true,
                -- …etc.
            },
    },
    {
        "nvim-lualine/lualine.nvim",
        -- If you want to have icons in your statusline choose one of these
        --dependencies  = {"nvim-tree/nvim-web-devicons"}
    },
    --DEBUGGER
    {
        "mfussenegger/nvim-dap"
    },
    {
        "rcarriga/nvim-dap-ui", 
            dependencies = {"mfussenegger/nvim-dap"} 
    },
    { 
        "theHamsta/nvim-dap-virtual-text",
            dependencies = {"mfussenegger/nvim-dap"}
    },
    { 
        "nvim-telescope/telescope-dap.nvim", 
            dependencies = {"mfussenegger/nvim-dap"} 
    }
})
