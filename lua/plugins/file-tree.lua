return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	init = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.schedule(function()
					if vim.bo.filetype == "neo-tree" then
						vim.cmd("wincmd p")
					end
				end)
			end,
		})
	end,
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",

		enable_git_status = true,
		enable_diagnostics = true,

		default_component_configs = {
			indent = {
				indent_size = 2,
				padding = 1,
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
			},
			git_status = {
				symbols = {
					added = "✚",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "★",
					ignored = "◌",
					unstaged = "✗",
					staged = "✓",
					conflict = "",
				},
			},
		},

		window = {
			position = "left",
			width = 30,
			mappings = {
				["<CR>"] = "open",
				["v"] = "open_vsplit",
				["s"] = "open_split",
				["t"] = "open_tabnew",
				["a"] = "add",
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy",
				["m"] = "move",
				["q"] = "close_window",
				["R"] = "refresh",
				["e"] = function(state)
					local small = 30
					local winid = state.winid
					local bufnr = state.bufnr

					-- 現在の幅
					local current = vim.api.nvim_win_get_width(winid)

					-- バッファ内の最大行長を取得
					local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
					local max_len = 0

					for _, line in ipairs(lines) do
						local len = vim.fn.strdisplaywidth(line)
						if len > max_len then
							max_len = len
						end
					end

					-- 少し余白を追加
					local padding = 2
					local calculated = max_len + padding

					-- 画面幅を超えないよう制限
					local screen_width = vim.o.columns
					local large = math.min(calculated, screen_width - 5)

					-- トグル動作
					local new_width = (current <= small) and large or small
					vim.api.nvim_win_set_width(winid, new_width)
				end,
			},
		},

		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			follow_current_file = {
				enabled = true,
			},
			use_libuv_file_watcher = true,
		},

		buffers = {
			follow_current_file = {
				enabled = true,
			},
		},

		git_status = {
			window = {
				position = "float",
			},
		},
	},

	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "NeoTree Toggle" },
		{
			"<leader>o",
			function()
				if vim.bo.filetype == "neo-tree" then
					vim.cmd("wincmd p") -- 元居たウィンドウに戻る
				else
					vim.cmd("Neotree focus")
				end
			end,
			desc = "NeoTree Focus Toggle",
		},
	},
}
