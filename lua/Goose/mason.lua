local status_ok, masonConfig = pcall(require, "mason")
local masonlsp_status_ok, masonLspConfig = pcall(require, "mason-lspconfig")
local lsp_status_ok = pcall(require, "lspconfig")
if not status_ok then
    return
end

if not masonlsp_status_ok then
    return
end

if not lsp_status_ok then
    return
end

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Info
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- Movements
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)

  -- Code actions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

end
local servers = {
    clangd = {},
    --
    -- https://github.com/razzmatazz/csharp-language-server/issues/55
    -- https://github.com/williamboman/mason.nvim/issues/832
    -- IMPORTANT: FOR .NET 7.0, you must install csharp_ls with at least version 0.6. RIGHT NOW THE DEFAULT INSTALLED IS 0.5.
    -- USE :MasonInstall csharp-language-server@0.7.0 TO MANUALLY INSTALL
    --
    --csharp_ls = {},
    lua_ls = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
}

masonConfig.setup()
masonLspConfig.setup({
    ensure_installed = vim.tbl_keys(servers)
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

masonLspConfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}
