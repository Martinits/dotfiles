------- NVIM.CMP -------

vim.o.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'
local luasnip = require'luasnip'

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
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
                cmp.complete()
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
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
    -- for cmp-dap
    -- enabled = function()
    --     return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
    --         or require("cmp_dap").is_dap_buffer()
    -- end,
    -- formatting = {
    --     fields = { "kind", "abbr", "menu" },
    --     max_width = 0,
    --     kind_icons = {
    --         Class = " ",
    --         Color = " ",
    --         Constant = "ﲀ ",
    --         Constructor = " ",
    --         Enum = "練",
    --         EnumMember = " ",
    --         Event = " ",
    --         Field = " ",
    --         File = "",
    --         Folder = " ",
    --         Function = " ",
    --         Interface = "ﰮ ",
    --         Keyword = " ",
    --         Method = " ",
    --         Module = " ",
    --         Operator = "",
    --         Property = " ",
    --         Reference = " ",
    --         Snippet = " ",
    --         Struct = " ",
    --         Text = " ",
    --         TypeParameter = " ",
    --         Unit = "塞",
    --         Value = " ",
    --         Variable = " ",
    --     },
    --     source_names = {
    --         nvim_lsp = "(LSP)",
    --         treesitter = "(TS)",
    --         emoji = "(Emoji)",
    --         path = "(Path)",
    --         calc = "(Calc)",
    --         cmp_tabnine = "(Tabnine)",
    --         vsnip = "(Snippet)",
    --         luasnip = "(Snippet)",
    --         buffer = "(Buffer)",
    --         spell = "(Spell)",
    --     },
    --     duplicates = {
    --         buffer = 1,
    --         path = 1,
    --         nvim_lsp = 0,
    --         luasnip = 1,
    --     },
    --     duplicates_default = 0,
    --     format = function(entry, vim_item)
    --         local max_width = cmp_config.formatting.max_width
    --         if max_width ~= 0 and #vim_item.abbr > max_width then
    --             vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
    --         end
    --         vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
    --         vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
    --         vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
    --             or cmp_config.formatting.duplicates_default
    --         return vim_item
    --     end,
    -- },
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

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- }
