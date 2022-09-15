local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

local telescope = function(t)
  return function()
    require("telescope.builtin")[t.picker](t.opts)
  end
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "p", "_dP", { silent = true })

local window_navigation = {
  name = "Window navigation",
  ["<c-j>"] = { "<c-w><c-j>", "Move to window below" },
  ["<c-k>"] = { "<c-w><c-k>", "Move to window above" },
  ["<c-l>"] = { "<c-w><c-l>", "Move to window right" },
  ["<c-h>"] = { "<c-w><c-h>", "Move to window left" },
}

local buf_tab_navigation = {
  name = "Buffer and Tab navigation",
  ["<leader>"] = {
    ["<tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Move to next tab" },
    ["<s-tab>"] = { "<cmd>BufferLineCyclePrev<cr>", "Move to previous tab" },
  },
  ["<s-l>"] = { "<cmd>bnext<cr>", "Move to next buffer" },
  ["<s-h>"] = { "<cmd>bnext<cr>", "Move to previous buffer" },
}

local resize = {
  name = "Resize",
  ["<leader>"] = {
    w = { "<c-w>_", "Set current window height to maximum" },
    h = { "<c-w>|", "Set current window width to maximum" },
    z = { "<c-w>=", "Make all windows equally high and wide" },
  },
  ["<c-up>"] = { "<cmd>resize +2<cr>", "Increase current window height by 2" },
  ["<c-down>"] = { "<cmd>resize -2<cr>", "Decrease current window height by 2" },
  ["<c-left>"] = { "<cmd>vertical resize +2<cr>", "Increase current window width by 2" },
  ["<c-right>"] = { "<cmd>vertical resize -2<cr>", "Decrease current window width by 2" },
}

local telescope_cmds = {
  name = "Telescope commands",
  ["<leader>"] = {
    ["/"] = { telescope { picker = "current_buffer_fuzzy_find", opts = {} }, "Search in current buffer" },
    ["fb"] = { telescope { picker = "buffers", opts = {} }, "Search buffers" },
    ["fh"] = { telescope { picker = "help_tags", opts = {} }, "Help tags" },
  },
  ["<c-p>"] = { telescope { picker = "find_files", opts = { hidden = true } }, "Find files" },
  ["<c-f>"] = { telescope { picker = "live_grep", opts = {} }, "Search through project" },
}

local trouble_cmds = {
  name = "Trouble commands",
  ["<leader>"] = {
    xx = { "<cmd>TroubleToggle<cr>", "Toggle trouble" },
    xw = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace diagnostics from LSP client" },
    xd = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document diagnostics from LSP client" },
    xl = { "<cmd>TroubleToggle loclist<cr>", "Items for the window's location list" },
    xq = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix items" },
  },
  ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "References of the word under the cursor from LSP client" },
}

local format_cmd = {
  name = "Format",
  ["<leader>f"] = { vim.lsp.buf.formatting, "Format file" },
}
local nvim_tree_cmds = {
  name = "Nvim-tree commands",
  ["<c-n>"] = { "<cmd>NvimTreeToggle<cr>", "Toggle tree" },
}

local sniprun_cmds = {
  name = "Code runner",
  ["<leader>l"] = { "<cmd>SnipRun<cr>", "Run line" },
}

local indent = {
  name = "Indent",
  ["<"] = { "<gv", "Move selected text to the left" },
  [">"] = { ">gv", "Move selected text to the right" },
}

local move_text = {
  name = "Move text up and down",
  ["<a-k>"] = { "<cmd>move .-2<cr>==", "Move selected text up" },
  ["<a-j>"] = { "<cmd>move .+1<cr>==", "Move selected text down" },
}

local move_block_text = {
  name = "Move block text",
  ["K"] = { "<cmd>move '<-2<cr>gv-gv", "Move line up" },
  ["J"] = { "<cmd>move '>+1<cr>gv-gv", "Move line down" },
  ["<a-k>"] = { "<cmd>move '<-2<cr>gv-gv", "Move selected text up" },
  ["<a-j>"] = { "<cmd>move '>+1<cr>gv-gv", "Move selected text down" },
}

wk.register(window_navigation, { mode = "n" })
wk.register(buf_tab_navigation, { mode = "n" })
wk.register(resize, { mode = "n" })
wk.register(telescope_cmds, { mode = "n" })
wk.register(trouble_cmds, { mode = "n" })
wk.register(nvim_tree_cmds, { mode = "n" })
wk.register(format_cmd, { mode = "n" })
wk.register(sniprun_cmds, { mode = "n" })
wk.register(sniprun_cmds, { mode = "v" })
wk.register(indent, { mode = "v" })
wk.register(move_text, { mode = "v" })
wk.register(move_block_text, { mode = "x" })
