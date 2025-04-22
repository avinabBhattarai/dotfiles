return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				-- Specify Prettier for JavaScript/TypeScript files
				null_ls.builtins.formatting.prettier.with({
					-- You can add conditions if needed for file types
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"json",
						"html",
						"css",
						"markdown",
					},
				}),
				-- Specify gofmt for Go files
				null_ls.builtins.formatting.gofmt.with({
					filetypes = { "go" },
				}),
				-- Include other sources if necessary
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.golangci_lint,
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									-- Only use null-ls for formatting instead of the LSP server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
		-- You can bind a key to format with the selected LSP
		vim.keymap.set("n", "<space>gf", vim.lsp.buf.format)
	end,
}
