return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
			},
		},
		opts = {
			pickers = {
				find_files = {
					hidden = true,
					theme = "ivy",
				},
				grep_string = {
					additional_args = { "--hidden" },
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},

			extensions_list = { "ui-select", "fzf" },
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_ivy({}),
				},
				live_grep_args = {
					additional_args = { "--hidden" },
				},
			},
		},

		config = function(_, opts)
			for _, exts in ipairs(opts.extensions_list) do
				require("telescope").load_extension(exts)
			end
			require("telescope").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release; cmake --build build --config Release",
		lazy = false,
	},
}
