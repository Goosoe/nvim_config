require("Goose.set")
require("Goose.remap")
require("Goose.treesitter_conf")
local nvim_lsp = require('lspconfig')
nvim_lsp.tsserver.setup {}
print("Loaded Goose config")



