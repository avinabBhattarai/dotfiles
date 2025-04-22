return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy",
					},
					live_grep = {
						theme = "ivy",
					},
					grep_string = {
						theme = "ivy",
					},
				},

				extensions = {
					fzf = {},
				},
			})
			vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
			vim.keymap.set("n", "<leader>fs", require("telescope.builtin").live_grep)
			vim.keymap.set("n", "<leader>fc", require("telescope.builtin").grep_string)
			vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
			vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
