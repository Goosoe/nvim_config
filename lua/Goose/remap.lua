local nnoremap = require("Goose.keymap").nnoremap
local vnoremap = require("Goose.keymap").vnoremap
local tnoremap = require("Goose.keymap").tnoremap

-- TELESCOPE --
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")     -- file finder
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")      -- string finder
nnoremap("<leader><tab>", "<cmd>Telescope buffers<CR>")        -- show buffers
nnoremap("<leader>ft", "<cmd>Telescope help_tags<CR>")      -- show tags
nnoremap("<leader>wp", "<cmd>Telescope projects<CR>")      -- show tags

-- DEFAULT COMMANDS --
nnoremap("<C-d>", "<C-d>zz")                        -- center line when going down
nnoremap("<C-u>", "<C-u>zz")                        -- center line when going up

nnoremap("<leader>ee", "<cmd>NvimTreeToggle<CR>")                       -- open netrw
nnoremap("<leader>qq", "<cmd>w<CR><cmd>bd!<CR>")            -- save and close current buffer
nnoremap("<leader>QQ", "<cmd>bd!<CR>")                      -- close current buffer WITHOUT saving

nnoremap("<leader>pp", "\"*p")                           -- paste from clipboard reg - normalmode
vnoremap("<leader>p", "\"+p")                           -- paste from clipboard reg - visualmode
-- inoremap("<leader>p!", "<C-r>*")                         -- paste from clipboard reg - insertmode 
nnoremap("<leader>py", "\"0p")                          -- paste from yank reg - normalmode
-- inoremap("<leader>py!", "<C-r>0")                        -- paste from yank reg - insertmode 
nnoremap("<leader>pd", "\"1p")                          -- paste from del reg - normalmode
-- inoremap("<leader>pd!", "<C-r>1")                        -- paste from del reg - insertmode 

nnoremap("<leader>y", "\"+y")                           -- copy to clipboard reg - normalmode
nnoremap("<leader>yy", "\"+yy")                         -- copy to clipboard reg - normalmode
vnoremap("<leader>y", "\"+y")                           -- copy to clipboard reg - visualmode
vnoremap("<leader>yy", "\"+yy")                         -- copy to clipboard reg - visualmode


-- TERMINAL --
nnoremap("<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
tnoremap('<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
