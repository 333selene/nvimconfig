return {
    "folke/tokyonight.nvim",
    lazy = false, -- load during startup
    priority = 1000, -- load first
    config = function()
        vim.cmd([[colorscheme tokyonight]])
    end,
}
