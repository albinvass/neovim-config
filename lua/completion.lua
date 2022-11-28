local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            --elseif vim.fn["vsnip#available"](1) == 1 then
            --    feedkey("<Plug>(vsnip-expand-or-jump)", "")
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            --elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            --    feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'cmp_tabnine' }
    }, {
        { name = 'buffer' },
    })
})

local nvim_lsp = require('lspconfig')

local servers = {
    sumneko_lua={},
    rnix={},
    pylsp={},
    bashls={},
    dockerls={},
    clangd={},
    terraformls={_on_attach=function()
            vim.api.nvim_create_autocmd({"BufWritePre"}, {
                pattern = {"*.tf", "*.tfvars"},
                callback = vim.lsp.buf.formatting_sync
            })
        end
    },
}

for lsp, conf in pairs(servers) do
    conf['on_attach'] = function()
        if conf['_on_attach'] ~= nil then
            conf._on_attach()
        end
    end

    conf['flags'] = {
        debounce_text_changes = 150,
    }

    nvim_lsp[lsp].setup(conf)
end
