-- live_grep_args
-- -h: Show ripgrep's condensed help output.
-- --help: Show ripgrep's longer form help output. (Nearly what you'd find in ripgrep's man page, so pipe it into a pager!)
-- -i/--ignore-case: When searching for a pattern, ignore case differences. That is rg -i fast matches fast, fASt, FAST, etc.
-- -S/--smart-case: This is similar to --ignore-case, but disables itself if the pattern contains any uppercase letters. Usually this flag is put into alias or a config file.
-- -F/--fixed-strings: Disable regular expression matching and treat the pattern as a literal string.
-- -w/--word-regexp: Require that all matches of the pattern be surrounded by word boundaries. That is, given pattern, the --word-regexp flag will cause ripgrep to behave as if pattern were actually \b(?:pattern)\b.
-- -c/--count: Report a count of total matched lines.
-- --files: Print the files that ripgrep would search, but don't actually search them.
-- -a/--text: Search binary files as if they were plain text.
-- -U/--multiline: Permit matches to span multiple lines.
-- -z/--search-zip: Search compressed files (gzip, bzip2, lzma, xz, lz4, brotli, zstd). This is disabled by default.
-- -C/--context: Show the lines surrounding a match.
-- --sort path: Force ripgrep to sort its output by file name. (This disables parallelism, so it might be slower.)
-- -L/--follow: Follow symbolic links while recursively searching.
-- -M/--max-columns: Limit the length of lines printed by ripgrep.
-- --debug: Shows ripgrep's debug output. This is useful for understanding why a particular file might be ignored from search, or what kinds of configuration ripgrep is loading from the environment.


local status, telescope = pcall(require, "telescope")
if not status then
    vim.notify("没有找到 telescope")
    return
end

-- local actions = require("telescope.actions")
telescope.setup({
    defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = "insert",
        -- vertical , center , cursor
        layout_strategy = "horizontal",
        -- 窗口内快捷键
        mappings = require("keybindings").telescopeList,
    },
    pickers = {
        find_files = {
            -- theme = "dropdown", -- 可选参数： dropdown, cursor, ivy
            find_command = { "fd" }
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                -- even more opts
            }),
        },
        live_grep_args = {
            auto_quoting = false, -- enable/disable auto-quoting
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                }
            }
        }
    },
})


pcall(telescope.load_extension, "env")
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "vim_bookmarks")
pcall(telescope.load_extension, "live_grep_args")
