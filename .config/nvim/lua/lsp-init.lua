------- NVIM.LSPCONFIG -------

-- mapping
-- vim.keymap.set('n', '<LEADER>e', vim.diagnostic.open_float, { silent = true, desc = "diagnostic open float" })
-- vim.keymap.set('n', '<LEADER>-', vim.diagnostic.goto_prev, { silent = true, desc = "diagnostic goto prev" })
-- vim.keymap.set('n', '<LEADER>=', vim.diagnostic.goto_next, { silent = true, desc = "diagnostic goto next" })
vim.keymap.set('n', '<LEADER>dd', vim.diagnostic.setloclist, { silent = true, desc = "diagnostic loclist" })

local function preview_location_callback(_, result)
    if result == nil or vim.tbl_isempty(result) then
        return nil
    end
    vim.lsp.util.preview_location(result[1])
end

function PeekDefinition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

local on_attach = function(client, bufnr)
    -- LSP functions mapping
    local bufopts = { silent=true, buffer=bufnr }

    bufopts.desc = "goto declaration"
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)

    bufopts.desc = "goto definition"
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

    bufopts.desc = "peek definition"
    vim.keymap.set('n', '<LEADER>dp', PeekDefinition, bufopts)

    bufopts.desc = "clangd switch source header"
    vim.keymap.set('n', 'gsh', '<CMD>ClangdSwitchSourceHeader<CR>', bufopts)

    bufopts.desc = "hover doc"
    vim.keymap.set('n', 'gH', vim.lsp.buf.hover, bufopts)

    bufopts.desc = "goto implementation"
    vim.keymap.set('n', 'gp', vim.lsp.buf.implementation, bufopts)

    -- bufopts.desc = "signature help"
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    bufopts.desc = "goto type definition"
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)

    -- bufopts.desc = "rename symbol"
    -- vim.keymap.set('n', '<LEADER>rn', vim.lsp.buf.rename, bufopts)

    -- bufopts.desc = "code action"
    -- vim.keymap.set('n', '<LEADER>ca', vim.lsp.buf.code_action, bufopts)

    bufopts.desc = "show references"
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    bufopts.desc = "format"
    vim.keymap.set({'n', 'v'}, '<LEADER>mt', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- show line diagnostic auto in hover window
    -- vim.api.nvim_create_autocmd("CursorHold", {
    --     buffer = bufnr,
    --         callback = function()
    --             local opts = {
    --                 focusable = false,
    --                 close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --                 source = 'always',
    --                 prefix = ' ',
    --             }
    --             vim.diagnostic.open_float(nil, opts)
    --         end
    -- })

    -- highlight cursor word
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
            hi! LspReferenceRead cterm=underline gui=underline guisp=LightYellow
            hi! LspReferenceText cterm=underline gui=underline guisp=LightYellow
            hi! LspReferenceWrite cterm=underline gui=underline guisp=LightYellow
        ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })
        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

-- float window border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts)
    opts = opts or {}
    opts.border = opts.border or 'single'
    return orig_util_open_floating_preview(contents, syntax, opts)
end

-- completion kinds icons
local icons = {
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = " ",
    EnumMember = " ",
    Field = " ",
    Folder = "ﱮ ",
    Function = " ",
    Interface = "ﰮ ",
    Method = " ",
    Module = " ",
    Property = " ",
    Snippet = " ",
    Text = " ",
    Unit = "ﰩ ",
    Value = " ",
    Variable = " ",
    Class = "ﴯ ",
    Keyword = " ",
    File = " ",
    Reference = " ",
    Struct = "פּ ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
}
local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
    kinds[i] = icons[kind] or kind
end

-- diagnostic config
vim.diagnostic.config({
    virtual_text = false,
    underline = { severity = vim.diagnostic.severity.WARN },
    float = { source = 'always' },
})

-- icons in signcolumn
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- show highest diagnostic in signcolumn only
local ns = vim.api.nvim_create_namespace("highest_sign")
local orig_signs_handler = vim.diagnostic.handlers.signs
vim.diagnostic.handlers.signs = {
    show = function(_, bufnr, _, opts)
        local diagnostics = vim.diagnostic.get(bufnr)
        local max_severity_per_line = {}
        for _, d in pairs(diagnostics) do
              local m = max_severity_per_line[d.lnum]
              if not m or d.severity < m.severity then
                  max_severity_per_line[d.lnum] = d
              end
        end
        local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
        orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
    end,
    hide = function(_, bufnr)
        orig_signs_handler.hide(ns, bufnr)
    end,
}

local common_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- language servers
-- c/c++
require('lspconfig').ccls.setup{
    on_attach = on_attach,
    capabilities = common_capabilities
}

-- python
require('lspconfig').pyright.setup{
    on_attach = on_attach,
    capabilities = common_capabilities
}

-- rust
require('lspconfig').rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = common_capabilities
}

-- lua
require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = common_capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                }
            }
        }
    }
}

-- json
require'lspconfig'.jsonls.setup {
    capabilities = common_capabilities,
}
