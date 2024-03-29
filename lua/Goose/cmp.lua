local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

-- Configure completion menu
vim.opt.completeopt= {"menu", "menuone", "noselect"}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
           require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        --['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
    }),
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lua = "[API]",
                nvim_lsp = "[LSP]",
                path = "[Path]",
                buffer = "[Buff]",
                luasnip = "[Snip]",
            })[entry.source.name]
            return vim_item
        end
    },
})


