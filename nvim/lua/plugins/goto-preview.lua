return {
	"rmagatti/goto-preview",
	lazy = false,
	config = function()
		require("goto-preview").setup({ default_mappings = true })
	end,
}
