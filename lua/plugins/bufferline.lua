return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        opts = {
            options = {
                mode = "buffers", -- "tabs" も可
                diagnostics = "nvim_lsp",
                separator_style = "slant", -- "slant" | "thick" | "thin"
                always_show_bufferline = true,
                show_close_icon = false,
                show_buffer_close_icons = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },
            },
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bufdelete = { enabled = true },
        },
    },
}

