return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",

	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "printf" },
		sync_install = false,
		highlight = { enable = true, use_languagetree = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
