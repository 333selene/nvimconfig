vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
-- 1 important
-- 2 moving around
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.opt.autochdir = on                         -- change to directory of file in buffer
-- 3 tags
-- 4 displaying text
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                  -- set relative numbered lines
vim.opt.numberwidth = 1                         -- set number column width to 2 {default 4}
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- 5 syntax, highlighting, and spelling
vim.opt.hlsearch = false                         -- highlight all matches on previous search pattern
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.cursorline = true                       -- highlight the current line
spell = true                                    -- highlight spelling mistakes
-- 6 multiple windows
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
-- 7 multiple tab pages
vim.opt.showtabline = 0                          -- always show tabs
-- 8 terminal
-- 9 mouse
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
-- 10 messages and info
vim.opt.shortmess:append "c"
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
-- 11 selecting text
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
-- 12 editing text
vim.opt.undofile = true                         -- enable persistent undo
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.pumheight = 10                          -- pop up menu height
-- 13 tabs and indenting
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.smartindent = true                      -- make indenting smarter again
-- 14 folding
-- 15 diff mode
-- 16 mapping
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
-- 17 reading and writing files
vim.opt.backup = false                          -- creates a backup file
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- 18 the swap file
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
-- 19 command line editing
-- 20 executing external commands
-- 21 running make and jumping to errors
-- 22 language specific
-- 23 multi-byte characters
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
-- 24 various
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time

vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

