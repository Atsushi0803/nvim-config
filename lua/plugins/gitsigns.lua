return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            signs = {
                add          = { text = "│" },
                change       = { text = "│" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
            },
            signcolumn = true,
            numhl      = false,
            linehl     = false,
            current_line_blame = true,
            update_debounce = 200,
        },
    },
}

