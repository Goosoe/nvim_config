local nnoremap = require("Goose.keymap").nnoremap
local inoremap = require("Goose.keymap").inoremap

-- TELESCOPE --
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")     -- file finder
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")      -- string finder
nnoremap("<leader><tab>", "<cmd>Telescope buffers<CR>")        -- show buffers
nnoremap("<leader>ft", "<cmd>Telescope help_tags<CR>")      -- show tags

-- DEFAULT COMMANDS --
nnoremap("<leader>ee", "<cmd>Ex<CR>")                       -- open netrw
nnoremap("<leader>qq", "<cmd>w<CR><cmd>bd!<CR>")            -- save and close current buffer
nnoremap("<leader>QQ", "<cmd>bd!<CR>")                      -- close current buffer WITHOUT saving
nnoremap("<leader>p", "\"*p<CR>")                           -- paste from clipboard reg - normalmode
inoremap("<leader>p", "<C-r>*<CR>")                         -- paste from clipboard reg - insertmode 
nnoremap("<leader>py", "\"0p<CR>")                           -- paste from clipboard reg - normalmode
inoremap("<leader>py", "<C-r>0<CR>")                         -- paste from clipboard reg - insertmode 
nnoremap("<leader>pd", "\"1p<CR>")                           -- paste from clipboard reg - normalmode
inoremap("<leader>pd", "<C-r>1<CR>")                         -- paste from clipboard reg - insertmode 
