require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

--- dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })
map("n", "<leader>dc", function()
  require("dapui").close()
end, { desc = "Close the debugger ui" })
map("n", "<leader>dt", function()
  require("dapui").toggle()
end, { desc = "Toggle the debugger ui" })

--- cpp

map("n", "<leader>cs", "<cmd> ClangdSwitchSourceHeader <CR>", { desc = "Switch between source and header file (C++)" })
map("n", "<leader>cr", "<cmd> ClangdAST <CR>", { desc = "Switch between source and header file (C++)" })
map("n", "<leader>ci", "<cmd> ClangdSymbolInfo <CR>", { desc = "View info for symbol at cursor" })
map("n", "<leader>ct", "<cmd> ClangdTypeHierarchy <CR>", { desc = "View type hierarchy, gd for type def" })
map("n", "<leader>cu", "<cmd> ClangdMemoryUsage <CR>", { desc = "View memory usage. zc to fold items" })
map("n", "<leader>co", "<cmd> ClangdToggleInlayHints <CR>", { desc = "Toggle hints" })

--- crates
map("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "Update all crates" })

--- git
map("n", "<leader>gn", ":Neogit<CR>", { desc = "Open Neogit", silent = true })
map("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open diffview", silent = true })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close diffview", silent = true })

---telescope
map(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live grep with args", silent = true }
)

--- misc
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code action", silent = true })
map("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", { desc = "Toggle diagnostics", silent = true })

--- iron
vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>")
vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>")
vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
