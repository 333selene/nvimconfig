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
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("*", {
				root_markers = { ".git" },
			})

			local servers = {
				clangd = {
					root_markers = { ".clang-format", "compile_commands.json" },
				},
				lua_ls = {

					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
						},
					},
				},
				pyright = {
					root_markers = { ".venv", ".git" },
					settings = {
						python = {
							pythonPath = vim.fn.exepath("python3"),
							analysis = {
								diagnosticMode = "workspace",
							},
						},
					},
				},
				ruff = {},
				cssls = {},
				vtsls = {
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
					settings = {
						vtsls = {
							-- autoUseWorkspaceTsdk = true,
							tsserver = {
								log = "verbose",
								maxTsServerMemory = 10000,
								globalPlugins = {
									{
										name = "@vue/typescript-plugin",
										location = "/opt/homebrew/lib/node_modules/@vue/typescript-plugin",
										languages = { "vue" },
										configNamespace = "typescript",
										enableForWorkspaceTypeScriptVersions = true,
									},
								},
							},
						},
					},
				},
				html = {},
				lemminx = {},
			}

			for name, cfg in pairs(servers) do
				cfg.capabilities = capabilities
				vim.lsp.config(name, cfg)
				vim.lsp.enable(name)
			end
		end,
	},
}
