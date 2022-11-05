return function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    return
  end

  local actions = require "telescope.actions"
  local action_layout = require "telescope.actions.layout"
  local previewers = require "telescope.previewers"
  local sorters = require "telescope.sorters"
  -- local fb_actions = telescope.extensions.file_browser.actions

  telescope.setup {
    defaults = {
      prompt_prefix = " 🔍 ",
      selection_caret = "❯ ",
      color_devicons = true,
      winblend = 0,

      preview = { hide_on_startup = true, timeout = 1000 },
      file_sorter = sorters.get_fzf_sorter,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,

      sorting_strategy = "ascending",

      layout_config = {
        horizontal = {
          width = 0.85,
          prompt_position = "top",
          preview_width = 0.60,
        },
      },
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<A-h>"] = actions.which_key,
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
  }

  telescope.load_extension "fzf"
  telescope.load_extension "file_browser"
end
