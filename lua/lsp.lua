local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end


local servers = {
    pylsp={_on_attach=require'completion'.on_attach},
    bashls={_on_attach=require'completion'.on_attach},
    dockerls={_on_attach=require'completion'.on_attach},
    clangd={_on_attach=require'completion'.on_attach},
    terraformls={_on_attach=function()
            vim.api.nvim_create_autocmd({"BufWritePre"}, {
                pattern = {"*.tf", "*.tfvars"},
                callback = vim.lsp.buf.formatting_sync
            })
            require'completion'.on_attach
        end
    },
}

for lsp, conf in pairs(servers) do
    conf['on_attach'] = function()
        on_attach()
        if conf['_on_attach'] ~= nil then
            conf._on_attach()
        end
    end

    conf['flags'] = {
        debounce_text_changes = 150,
    }

    nvim_lsp[lsp].setup(conf)
end

vim.cmd [[
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
]]

let g:completion_enable_snippet = 'UltiSnips'
