local nnoremap = require("Goose.keymap").nnoremap

-- TELESCOPE --
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")     -- file finder
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")      -- string finder
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")        -- show buffers
nnoremap("<leader>ft", "<cmd>Telescope help_tags<CR>")      -- show tags

-- DEFAULT COMMANDS --
nnoremap("<leader>pp", "<cmd>Ex<CR>")                       -- open netrw
nnoremap("<leader>qq", "<cmd>w<CR><cmd>bd!<CR>")            -- save and close current buffer
nnoremap("<leader>QQ", "<cmd>bd!<CR>")                      -- close current buffer WITHOUT saving
