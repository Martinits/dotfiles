------- NVIM.CMP -------

vim.o.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'
local luasnip = require'luasnip'

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    if vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("") then print("yes!!!") end
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete(nil)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'plugins' },
        { name = 'spell' },
        { name = 'git' },
        { name = 'calc' },
        { name = 'emoji' },
        { name = 'treesitter' },
        { name = 'crates' },
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- icons
            local kinds = vim.lsp.protocol.CompletionItemKind
            vim_item.kind = kinds[kinds[vim_item.kind]]
            -- dups
            vim_item.dup = ({
                nvim_lsp = 0,
            })[entry.source.name] or 1
            return vim_item
        end,
    },
    -- for cmp-dap
    -- enabled = function()
    --     return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
    --         or require("cmp_dap").is_dap_buffer()
    -- end,
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp_document_symbol' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- for cmp-dap
-- cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
--   sources = {
--     { name = "dap" },
--   },
-- })
