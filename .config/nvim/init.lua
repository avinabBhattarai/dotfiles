require("config.lazy")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
		vim.o.tabstop = 4
		vim.o.expandtab = true
		vim.o.softtabstop = 4
		vim.o.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "html", "css", "markdown" },
	callback = function()
		vim.o.tabstop = 2
		vim.o.expandtab = true
		vim.o.softtabstop = 2
		vim.o.shiftwidth = 2
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

local diagnostics_active = true

vim.keymap.set("n", "<leader>td", function()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.enable()
		print("Diagnostics enabled")
	else
		vim.diagnostic.disable()
		print("Diagnostics disabled")
	end
end, { desc = "Toggle LSP Diagnostics" })

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "Cycle through windows" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make equal width" })
vim.keymap.set("n", "<leader>sm", ":Maximize<CR>", { desc = "Maximize split" })

vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Make equal width" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Make equal width" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Make equal width" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Make equal width" })

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Remove search highlight" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Add" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Substract" })

vim.keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })

vim.keymap.set("n", "<leader>gh", ":GoDoc<CR>", { desc = "GoDoc" })
