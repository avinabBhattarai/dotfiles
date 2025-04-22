return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				theme = "dragon",
				overrides = function()
					return {
						Normal = { bg = "#1b1d1e" }, -- your custom background
					}
				end,
			})
			vim.cmd([[colorscheme kanagawa-dragon]])
		end,
	},
}
