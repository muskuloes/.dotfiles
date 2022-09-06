local map = function(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

local telescope = function(picker)
  return function()
    require("telescope.builtin")[picker]()
  end
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- window navigation
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")

-- Resize windows
map("n", "<leader>w", "<c-w>_")
map("n", "<leader>h", "<c-w>|")
map("n", "<leader>z", "<c-w>=")
map("n", "<c-up>", ":resize +2<cr>")
map("n", "<c-down>", ":resize -2<cr>")
map("n", "<c-left>", ":vertical resize +2<cr>")
map("n", "<c-right>", ":vertical resize -2<cr>")

-- Buffer and Tab navigation
map("n", "<s-l>", ":bnext<cr>")
map("n", "<s-h>", ":bprevious<cr>")
map("n", "<leader><tab>", ":BufferLineCycleNext<cr>")
map("n", "<leader><s-tab>", ":BufferLineCyclePrev<cr>")

-- Telescope keymaps
map("n", "<c-p>", telescope "find_files")
map("n", "<c-f>", telescope "live_grep")
map("n", "<leader>/", telescope "current_buffer_fuzzy_find")
map("n", "<leader>fb", telescope "current_buffer_fuzzy_find")
map("n", "<leader>fh", telescope "help_tags")

-- Lua
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<a-j>", ":move .+1<cr>==")
map("v", "<a-k>", ":move .-2<cr>==")

-- Don't yank old stuff after pasting new content
map("v", "p", "_dP")

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<cr>gv-gv")
map("x", "K", ":move '<-2<cr>gv-gv")
map("x", "<a-j>", ":move '>+1<cr>gv-gv")
map("x", "<a-k>", ":move '<-2<cr>gv-gv")
