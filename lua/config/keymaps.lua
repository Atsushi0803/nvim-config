vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>c", function()
    Snacks.bufdelete()
end, { desc = "Delete buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
