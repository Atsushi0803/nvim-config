return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		enabled = true,
		opts = {
			options = {
				theme = "auto",
				globalstatus = true, -- 下に1本だけ表示（おすすめ）
				section_separators = "",
				component_separators = "|",
				icons_enabled = true,
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { { "filename", path = 1 } }, -- 相対パス表示
				lualine_x = { "diagnostics", "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
}
