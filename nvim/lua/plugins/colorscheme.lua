return {
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		keys = { { "<leader>C", "<cmd>MonokaiProSelect<cr>", desc = "Select Monokai pro filter" } },
		opts = {
			transparent_background = false,
			terminal_colors = true,
			devicons = true,
			-- styles = {
			-- 	comment = { italic = true },
			-- 	keyword = { italic = true }, -- any other keyword
			-- 	type = { italic = true }, -- (preferred) int, long, char, etc
			-- 	storageclass = { italic = true }, -- static, register, volatile, etc
			-- 	structure = { italic = true }, -- struct, union, enum, etc
			-- 	parameter = { italic = true }, -- parameter pass in function
			-- 	annotation = { italic = true },
			-- 	tag_attribute = { italic = true }, -- attribute of tag in reactjs
			-- },
			filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			day_night = {
				enable = false,
				day_filter = "pro",
				night_filter = "pro",
			},
			inc_search = "background", -- underline | background
			background_clear = {
				"notify",
				"bufferline",
				"telescope",
				"toggleterm",
			},
			plugins = {
				bufferline = {
					underline_selected = true,
					underline_visible = false,
					underline_fill = true,
					bold = false,
				},
				indent_blankline = {
					context_highlight = "pro", -- default | pro
					context_start_underline = false,
				},
			},
			override = function(c)
				return {
					-- ColorColumn = { bg = c.editor.background },
					["@field.python"] = { fg = c.base.cyan },
					DashboardRecent = { fg = c.base.magenta },
					DashboardProject = { fg = c.base.blue },
					DashboardConfiguration = { fg = c.base.white },
					DashboardSession = { fg = c.base.green },
					DashboardLazy = { fg = c.base.cyan },
					DashboardServer = { fg = c.base.yellow },
					DashboardQuit = { fg = c.base.red },
					IndentBlanklineChar = { fg = c.base.dimmed4 },
				}
			end,
			overridePalette = function(filter)
				if filter == "pro" then
					return {
						-- dark2 = "#101014",
						-- dark1 = "#16161E",
						-- background = "#0c0c0c",
						-- text = "#C0CAF5",
						-- accent1 = "#f7768e",
						-- accent2 = "#7aa2f7",
						-- accent3 = "#e0af68",
						-- accent4 = "#9ece6a",
						-- accent5 = "#0DB9D7",
						-- accent6 = "#9d7cd8",
						-- dimmed1 = "#737aa2",
						-- dimmed2 = "#787c99",
						-- dimmed3 = "#363b54",
						-- dimmed4 = "#363b54",
						-- dimmed5 = "#16161e",
					}
				end
			end,
		},
		config = function(_, opts)
			local monokai = require("monokai-pro")
			monokai.setup(opts)
			monokai.load()
		end,
	},
}
