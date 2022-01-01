local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

require("telescope").setup({
    defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "❯ ",
        color_devicons = true,
        winblend = 0,

        preview = { hide_on_startup = true, timeout=1000 },
        file_sorter = require("telescope.sorters").get_fzf_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        sorting_strategy = "ascending",

        layout_config = {
          horizontal = {
            width = 0.80,
            prompt_position = 'top',
            preview_width = 0.60
          }
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-h>"] = actions.which_key,
                ["<C-_>"] = action_layout.toggle_preview,
                ["<C-p>"] = false,
                ["<C-n>"] = false,
            },
        },
    },
    extensions = {
        fzf_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require('telescope').load_extension('fzf')
