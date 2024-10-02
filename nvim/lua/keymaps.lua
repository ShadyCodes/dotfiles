vim.g.mapleader = " "

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
map(
	"n",
	"<leader>co",
	":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
	{ desc = "Toggle hints", silent = true }
)

--- crates
map("n", "<leader>rcu", function()
	require("crates").upgrade_all_crates()
end, { desc = "Update all crates" })

--- git
map("n", "<leader>gn", ":Neogit<CR>", { desc = "Open Neogit", silent = true })
map("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open diffview", silent = true })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close diffview", silent = true })

--- misc
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code action", silent = true })
map("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", { desc = "Toggle diagnostics", silent = true })

map("n", "<tab>", ":BufferNext<CR>")
map("n", "<S-tab>", ":BufferPrevious<CR>")
map("n", "<leader>x", ":bdel<CR>")
map("n", "<leader>tr", ":ToggleTerm<CR>")

---nvchad defaults
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "General Format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
map(
	"n",
	"<leader>fg",
	":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ desc = "Live grep with args", silent = true }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })
