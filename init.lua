require("bloomai.options")
require("bloomai.keymaps")
require("config.lazy_init")
local todo_float = require("todofloat")
todo_float.setup({ target_file = "~/Documents/todo.md" })
vim.o.background = "dark"
vim.cmd([[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
    colorscheme gruvbox
]])
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
