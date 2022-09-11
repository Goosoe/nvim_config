vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.smartindent = true

vim.g.mapleader = " "

if (vim.g.neovide) then
    -- print("Running in Neovide!")
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 10
    vim.g.neovide_transparency = 0.9
    --there is a bug in neovide that it height is bigger than the screen on startup
    --so using the command below allows me to start using it without resizing the 
    --window first
    vim.opt.lines = 40
    -- vim.g.neovide_remember_window_size = true
    -- vim.g.neovide_fullscreen= true
end
