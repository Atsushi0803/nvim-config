return {
	"shellRaining/hlchunk.nvim",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		chunk = {
			enable = true,
			chars = {
				horizontal_line = "─",
				vertical_line = "│",
				left_top = "╭",
				left_bottom = "╰",
				right_arrow = "─",
			},
			duration = 0,
			delay = 0,
			style = {
				"#806d9c",
			},
		},
		indent = {
			enable = true,
			use_treesitter = false,
			delay = 0,
			chars = { "▏" },
			style = {
				vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
			},
		},
		blank = {
			enable = false,
			chars = {
				".",
			},
			style = {
				{ bg = "#434437" },
				{ bg = "#2f4440" },
				{ bg = "#433054" },
				{ bg = "#284251" },
			},
		},
		line_num = {
			enable = true,
		},
	},
}
