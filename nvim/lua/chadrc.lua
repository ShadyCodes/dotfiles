-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "monekai",
  tabufline = {
    order = { "buffers", "tabs", "btns" },
    enabled = true,
    overriden_modules = function(modules)
      table.insert(modules, modules[1])
      table.remove(modules, 1)
    end,
  },
}

vim.g.nvimtree_side = "right"

return M
