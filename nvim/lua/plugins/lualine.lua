local cmake = require("cmake-tools")

local config = {
	options = {
		icons_enabled = true,
		disabled_filetypes = { "alpha", "dashboard", "Outline", "packer", "NvimTree" },
		theme = "monokai-pro",
	},
	sections = {
		lualine_c = { "filename" },
	},
	tabline = {},
	extensions = {},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

ins_left({
	function()
		local c_preset = cmake.get_configure_preset()
		return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
	end,
	cond = function()
		return cmake.is_cmake_project() and cmake.has_cmake_preset()
	end,
	on_click = function(n, mouse)
		if n == 1 then
			if mouse == "l" then
				vim.cmd("CMakeSelectConfigurePreset")
			end
		end
	end,
})

ins_left({
	function()
		local type = cmake.get_build_type()
		return "CMake: [" .. (type and type or "") .. "]"
	end,
	cond = function()
		return cmake.is_cmake_project() and not cmake.has_cmake_preset()
	end,
	on_click = function(n, mouse)
		if n == 1 then
			if mouse == "l" then
				vim.cmd("CMakeSelectBuildType")
			end
		end
	end,
})

ins_left({
	function()
		local kit = cmake.get_kit()
		return "{" .. (kit and kit or "X") .. "}"
	end,
	cond = function()
		return cmake.is_cmake_project() and not cmake.has_cmake_preset()
	end,
	on_click = function(n, mouse)
		if n == 1 then
			if mouse == "l" then
				vim.cmd("CMakeSelectKit")
			end
		end
	end,
})

ins_left({
	function()
		local b_preset = cmake.get_build_preset()
		return "[" .. (b_preset and b_preset or "X") .. "]"
	end,
	cond = function()
		return cmake.is_cmake_project() and cmake.has_cmake_preset()
	end,
	on_click = function(n, mouse)
		if n == 1 then
			if mouse == "l" then
				vim.cmd("CMakeSelectBuildPreset")
			end
		end
	end,
})

ins_left({
	function()
		local b_target = cmake.get_build_target()
		return "<" .. (b_target and b_target or "X") .. ">"
	end,
	cond = cmake.is_cmake_project,
	on_click = function(n, mouse)
		if n == 1 then
			if mouse == "l" then
				vim.cmd("CMakeSelectBuildTarget")
			end
		end
	end,
})

ins_left({
	function()
		local l_target = cmake.get_launch_target()
		return "(" .. (l_target and l_target or "X") .. ")"
	end,
	cond = cmake.is_cmake_project,
	on_click = function(n, mouse)
		if n == 1 then
			if mouse == "l" then
				vim.cmd("CMakeSelectLaunchTarget")
			end
		end
	end,
})

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("lualine").setup(config)
	end,
}
