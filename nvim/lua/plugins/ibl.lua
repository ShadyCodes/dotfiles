return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = { char = "│" },
		-- scope = { enabled = true, char = "│", show_exact_scope = true, highlight = { "NonText" }, show_start = true },
		scope = {
			enabled = true,
			char = "|",
			show_start = true,
		},
	},
	config = function(_, opts)
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
		require("ibl").setup(opts)
		vim.cmd.highlight("clear @ibl.scope.underline.1")
		vim.cmd.highlight("link @ibl.scope.underline.1 Visual")
	end,
}
