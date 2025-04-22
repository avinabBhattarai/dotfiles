return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
			})
			vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true })
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"ast_grep",
					"ruff",
					"basedpyright",
					"gopls",
					"eslint",
					"emmet_ls",
					"tailwindcss",
					"cssls",
					"emmet_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local configs = require("lspconfig")
			configs.lua_ls.setup({ capabilities = capabilities })
			configs.ts_ls.setup({ capabilities = capabilities })
			configs.ast_grep.setup({ capabilities = capabilities })
			configs.gopls.setup({ capabilities = capabilities })
			configs.eslint.setup({ capabilities = capabilities })
			configs.tailwindcss.setup({ capabilities = capabilities })
			configs.emmet_language_server.setup({ capabilities = capabilities })
			configs.cssls.setup({ capabilities = capabilities })
			configs.basedpyright.setup({ capabilities = capabilities })
			vim.keymap.set("n", "<leader>re", vim.diagnostic.goto_next, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
		end,
	},
}
