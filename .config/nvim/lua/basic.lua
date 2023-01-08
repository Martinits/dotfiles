--------------------------------------------------------------------
--  ____    _    ____ ___ ____    ____ ___  _   _ _____ ___ ____  --
-- | __ )  / \  / ___|_ _/ ___|  / ___/ _ \| \ | |  ___|_ _/ ___| --
-- |  _ \ / _ \ \___ \| | |     | |  | | | |  \| | |_   | | |  _  --
-- | |_) / ___ \ ___) | | |___  | |__| |_| | |\  |  _|  | | |_| | --
-- |____/_/   \_\____/___\____|  \____\___/|_| \_|_|   |___\____| --
--                                                                --
--------------------------------------------------------------------


------- OPTIONS -------
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = true
vim.o.autochdir = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 100
vim.o.updatetime = 100
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.signcolumn = 'yes:2'
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.o.mousemodel = 'extend'
vim.o.list = true
vim.o.listchars = [[tab:▸ ,trail:▫]]
vim.o.scrolloff = 3
vim.o.inccommand = 'split'
vim.o.visualbell = true
vim.o.virtualedit = 'block'
-- return to last editing place
vim.api.nvim_create_autocmd('BufReadPost',
    {
        pattern = '*',
        command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
    }
)
-- terminal setting
vim.api.nvim_create_autocmd('TermOpen',
    {
        pattern = 'term://*',
        command = 'startinsert'
    }
)
-- highlight yanked
vim.api.nvim_create_autocmd('TextYankPost',
    {
        pattern = '*',
        callback = function() vim.highlight.on_yank({timeout=500}) end
    }
)


------- KEY MAPPINGS -------
vim.g.mapleader = ' '
-- fast move
vim.keymap.set('', 'H', '7h')
vim.keymap.set('', 'J', '5j')
vim.keymap.set('', 'K', '5k')
vim.keymap.set('', 'L', '7l')
vim.keymap.set('', '<C-e>', '$')
vim.keymap.set('', '<C-s>', '^')
-- join two lines (concatenate)
vim.keymap.set('', 'ct', ':join<CR>')
-- search result
vim.keymap.set('', '=', 'nzz')
vim.keymap.set('', '-', 'Nzz')
-- nohlsearch
-- vim.keymap.set('', '<LEADER>h', ':nohlsearch<CR>')
-- number           '
-- vim.keymap.set('', '<LEADER>n', ':set relativenumber!<CR>')
-- command
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')
vim.keymap.set('v', ';', ':')
vim.keymap.set('v', ':', ';')
-- split window
-- vim.keymap.set('', 'Qh', ':set nosplitright<CR>:vsplit<CR>')
-- vim.keymap.set('', 'Qj', ':set splitbelow<CR>:split<CR>')
-- vim.keymap.set('', 'Qk', ':set nosplitbelow<CR>:split<CR>')
-- vim.keymap.set('', 'Ql', ':set splitright<CR>:vsplit<CR>')
-- vim.keymap.set('', 'QH', '<C-w>H')
-- vim.keymap.set('', 'QJ', '<C-w>J')
-- vim.keymap.set('', 'QK', '<C-w>K')
-- vim.keymap.set('', 'QL', '<C-w>L')
-- vim.keymap.set('', 'qh', '<C-w>h')
-- vim.keymap.set('', 'qj', '<C-w>j')
-- vim.keymap.set('', 'qk', '<C-w>k')
-- vim.keymap.set('', 'ql', '<C-w>l')
-- vim.keymap.set('', 'q,', '<C-w><')
-- vim.keymap.set('', 'q.', '<C-w>>')
-- vim.keymap.set('', 'q-', '<C-w>-')
-- vim.keymap.set('', 'q=', '<C-w>+')
-- arrows in command mode
vim.keymap.set('c', '<C-s>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-k>', '<Up>')
vim.keymap.set('c', '<C-j>', '<Down>')
vim.keymap.set('c', '<C-h>', '<Left>')
vim.keymap.set('c', '<C-l>', '<Right>')
vim.keymap.set('c', '<C-b>', '<C-Left>')
vim.keymap.set('c', '<C-f>', '<C-Right>')
-- insert mode line edit
vim.keymap.set('i', '<C-s>', '<Home>')
vim.keymap.set('i', '<C-e>', '<End>')
-- vim.keymap.set('i', '<C-k>', '<Up>')
-- vim.keymap.set('i', '<C-j>', '<Down>')
-- vim.keymap.set('i', '<C-h>', '<Left>')
-- vim.keymap.set('i', '<C-l>', '<Right>')
-- vim.keymap.set('i', '<C-b>', '<C-Left>')
-- vim.keymap.set('i', '<C-f>', '<C-Right>')
-- find and replace
vim.keymap.set('', [[\s]], [[:%s//gc<Left><Left><Left>]])

vim.cmd([[
nnoremap <leader>sp :call SynStack()<CR>
function! SynStack()
  if !exists("*synstack")
    echo "netexist"
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
]])
