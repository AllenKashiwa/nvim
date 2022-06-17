local wk = require("which-key")


wk.register({
    f = {
        name = "file",
        s = { "<cmd>Telescope find_files<cr>", "Search File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        e = { "<cmd>NvimTreeToggle<cr>", "Open File Explore" },
        c = { "gg=G", "File Clean" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "File Format" },
        p = { "<cmd>let @+=expand('%:p')<cr>", "Copy File Path" },
    },
    w = {
        name = "window or workspace",
        f = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', "Workspace Folders" },
        s = { ":sp<CR>", "Window Split" },
        vs = { ":vsp<CR>", "Window Vertical Split" },
        h = { "<C-w>h", "Move to Left Window" },
        l = { "<C-w>l", "Move to Right Window" },
        j = { "<C-w>j", "Move to Down Window" },
        k = { "<C-w>k", "Move to Up Window" },
        c = { "<C-w>c", "Close Window" },
    },

}, { prefix = "<leader>" })

wk.register({
    ["<leader>b"] = { name = "+buffer" },
    ["<leader>bcc"] = { ":bw<cr>", "Close Cur Buffer" },
    ["<leader>bco"] = { ":%bdelete|edit #|normal `<CR>", "Close Other Buffers" },
})
