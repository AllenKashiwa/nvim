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
    b = {
        name = "buffer",
        cc = { ":bw<cr>", "Close Cur Buffer" },
        co = { ":%bdelete|edit #|normal `<cr>", "Close Other Buffers" },
    },
    d = {
        name = "diff",
        s = {'<cmd>vert diffsplit', "Diff Split"},
        t = {'<cmd>diffthis', "Diff This"},
    },
    c = {
        name = "code",
        a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code Action"},
    },
    s = {
        name = "symbol",
        s = { ":Telescope lsp_document_symbols<cr>", "Search Symbol" },
        r = { '<cmd>lua vim.lsp.buf.rename()<cr>', "Rename Symbol" },
    },
    q = {
        name = "quit",
        q = { ":q<cr>", "Quick Quit" },
        a = { ":qall<cr>", "Quit All" },
    },
    r = {
        name = "register",
        l = { ":Telescope registers<CR>", "List Registers" },
    },
    p = { ":Telescope projects<CR>", "+projects" },

}, { prefix = "<leader>" })

