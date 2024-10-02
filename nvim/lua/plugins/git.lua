return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		lazy = false,
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			require("gitsigns").setup()
		end,
	},
}
