return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- diagnostics icons
			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "? ",
						[vim.diagnostic.severity.WARN] = "? ",
						[vim.diagnostic.severity.HINT] = "?? ",
						[vim.diagnostic.severity.INFO] = "? ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
			-- LSP keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func)
						vim.keymap.set("n", keys, func, { buffer = event.buf })
					end

					map("gd", vim.lsp.buf.definition)
					map("gr", vim.lsp.buf.references)
					map("gi", vim.lsp.buf.implementation)
					map("K", vim.lsp.buf.hover)
					map("<leader>rn", vim.lsp.buf.rename)
					map("<leader>ca", vim.lsp.buf.code_action)
				end,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})

			vim.lsp.enable("lua_ls")

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("clangd", {
				cmd = { "clangd", "--compile-commands-dir=build" },
				capabilities = capabilities,
			})

			vim.lsp.enable("clangd")
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = { "L3MON4D3/LuaSnip" },
		build = "cargo build --release",
		opts = {
			sources = {
				default = {
					"lsp",
					"lazydev",
					"path",
					"buffer",
					"snippets",
				},

				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			keymap = { preset = "default" },
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
}
