return {
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		-- Main LSP Configuration (manual loop, always use vim.cwd as root)
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			-- ensure mason is setup for installing servers if desired
			require("mason").setup()

			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- define servers with root_dir always set to cwd
			local servers = {
				lua_ls = {
					root_dir = function()
						return vim.loop.cwd()
					end,
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
						},
					},
				},

				pyright = {
					root_dir = function()
						return vim.loop.cwd()
					end,
					settings = {
						python = {
							pythonPath = vim.fn.exepath("python3"),
						},
					},
				},

				jedi_language_server = {
					root_dir = function()
						return vim.loop.cwd()
					end,
				},

				ruff = {
					root_dir = function()
						return vim.loop.cwd()
					end,
				},
			}

			-- setup each server
			for name, cfg in pairs(servers) do
				cfg.capabilities = capabilities
				lspconfig[name].setup(cfg)
			end
		end,
	},
}
