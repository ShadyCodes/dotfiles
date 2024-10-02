-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require "haskell-tools"
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set(
  "n",
  "<space>cl",
  vim.lsp.codelens.run,
  { noremap = true, silent = true, buffer = bufnr, desc = "Run codelens" }
)
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set(
  "n",
  "<space>hs",
  ht.hoogle.hoogle_signature,
  { noremap = true, silent = true, buffer = bufnr, desc = "Hoogle search signature" }
)

-- Evaluate all code snippets
vim.keymap.set(
  "n",
  "<leader>ea",
  ht.lsp.buf_eval_all,
  { noremap = true, silent = true, buffer = bufnr, desc = "Evaluate all code snippets" }
)

-- Toggle a GHCi repl for the current package
vim.keymap.set(
  "n",
  "<leader>rr",
  ht.repl.toggle,
  { noremap = true, silent = true, buffer = bufnr, desc = "Toggle GHCi repl for package" }
)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set("n", "<leader>rf", function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, { noremap = true, silent = true, buffer = bufnr, desc = "Toggle GHCi repl for buffer" })

vim.keymap.set("n", "<leader>rq", ht.repl.quit, { noremap = true, silent = true, buffer = bufnr, desc = "Quit repl" })
