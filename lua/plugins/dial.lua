return {
	"monaqa/dial.nvim",
	lazy = false,
	config = function()
		local map = require("dial.map")
		local augend = require("dial.augend")
		local config = require("dial.config")

		config.augends:register_group({
			default = {
				-- numbers
				augend.integer.alias.decimal,
				augend.integer.alias.hex,

				-- boolean
				augend.constant.alias.bool,
				augend.constant.new({ elements = { "T", "F" } }),

				-- common toggles
				augend.constant.new({ elements = { "on", "off" } }),
				augend.constant.new({ elements = { "yes", "no" } }),

				-- level
				augend.constant.new({ elements = { "low", "medium", "high" } }),

				-- date
				augend.date.alias["%Y-%m-%d"],
				augend.date.alias["%Y/%m/%d"],

				-- version
				augend.semver.alias.semver,

				-- alphabet
				augend.constant.alias.alpha,
				augend.constant.alias.Alpha,
			},
		})

		vim.keymap.set("n", "<C-a>", map.inc_normal())
		vim.keymap.set("n", "<C-x>", map.dec_normal())
		vim.keymap.set("v", "<C-a>", map.inc_visual())
		vim.keymap.set("v", "<C-x>", map.dec_visual())
	end,
}
