-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter or "ignore_case" or "respect_case"
      case_mode = "smart_case",       -- the default case_mode is "smart_case"
      hidden = true,
    },
    workspaces = {
      -- keep insert mode after selection in the picker, default is false
      keep_insert = true,
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')
require('telescope').load_extension('workspaces')
