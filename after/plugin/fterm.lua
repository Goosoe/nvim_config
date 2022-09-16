require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
    ---Filetype of the terminal buffer
    ---@type string
    ft = 'FTerm',
    ---Command to run inside the terminal
    ---NOTE: if given string[], it will skip the shell and directly executes the command
    ---@type fun():(string|string[])|string|string[]
    cmd = "powershell",
    ---Highlight group for the terminal. See `:h winhl`
    ---@type string
    hl = 'Normal',
    ---Transparency of the floating window. See `:h winblend`
    ---@type integer
    blend = 0,
   ---Callback invoked when the terminal exits.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_exit = nil,

    ---Callback invoked when the terminal emits stdout data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stdout = nil,

    ---Callback invoked when the terminal emits stderr data.
    ---See `:h jobstart-options`
    ---@type fun()|nil
    on_stderr = nil,
})
