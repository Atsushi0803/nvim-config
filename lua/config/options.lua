local opt = vim.opt
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.number = true

vim.api.nvim_set_hl(0, "@keyword", { bold = true })
vim.api.nvim_set_hl(0, "@function", { bold = true })
vim.api.nvim_set_hl(0, "@type", { italic = true })

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "win32yank",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
}
opt.fixendofline = true
opt.endofline = true
opt.encoding = "utf-8"
opt.fileencodings = "utf-8, euc-jp"
