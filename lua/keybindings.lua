-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 浏览代码
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
-- 跳转
map("n", "<C-j>", "<C-i>", opt)
map("n", "<C-k>", "<C-o>", opt)

----------------- 文件操作 start --------------------
-- 兼容保存
map("n", "<C-s>", ":w<CR>", opt)

----------------- 文件操作  end --------------------


-----------------  文本编辑 start --------------------

-- visual mode下缩进
map('v', '<s-tab>', '<gv', opt)
map('v', '<tab>', '>gv', opt)
-- normal mode下缩进
map('n', '<s-tab>', 'V<', opt)
map('n', '<tab>', 'V>', opt)
-- 和系统剪切板互通
-- 复制到系统剪切板
map('v', '<C-c>', '"+y', opt)
map('n', '<C-c>', '"+y', opt)
map('n', '<C-c>', '"+yy', opt)
-- 从系统剪切板粘贴
map('n', '<C-v>', '"+p', opt)
map('v', '<C-v>', '"+p', opt)

-----------------  文本编辑 end --------------------


-----------------  分屏窗口 start ------------------

-- 垂直分屏
map("n", "<C-\\>", ":vsp<CR>", opt)

-- 关闭分屏窗口
map("n", "<A-w>", "<C-w>c", opt)
-- 跳转分屏窗口
map("n", "<C-ww>", "<C-w>h", opt)

-----------------  分屏窗口 end ------------------

----------------- leader start -------------------

-- f for file
-- file explore nvimTree
map('n', '<leader>fe', ':NvimTreeToggle<CR>', opt)
-- file clean nvim-treesitter 代码格式化
map("n", "<leader>fc", "gg=G", opt)
-- file search
map("n", "<leader>fs", ":Telescope find_files<CR>", opt)

-- b for buffer
-- 关闭buffer
map("n", "<leader>bc", ":bw<CR>", opt)

-- w for window
-- window split
map("n", "<leader>ws", ":sp<CR>", opt)
-- window vertical split
map("n", "<leader>wvs", ":vsp<CR>", opt)
-- window h for left
map("n", "<leader>wh", "<C-w>h", opt)
-- window h for right
map("n", "<leader>wl", "<C-w>l", opt)
-- window k for up
map("n", "<leader>wk", "<C-w>k", opt)
-- window j for down
map("n", "<leader>wj", "<C-w>j", opt)
-- window close
map("n", "<leader>wc", "<C-w>c", opt)

-- symbol search 查找当前symbol
map("n", "<leader>ss", ":Telescope lsp_document_symbols<CR>", opt)
-- registers list 列出寄存器 r for
map("n", "<leader>rl", ":Telescope registers<CR>", opt)

-- 列出项目 p for project
map("n", "<leader>p", ":Telescope projects<CR>", opt)
-- quit quit
map("n", "<leader>qq", ":q<CR>", opt)
-- quick all
map("n", "<leader>qa", ":qall<CR>", opt)

----------------- leader end -------------------


----------------- 插件快捷键 start -------------------



-- bufferline 左右切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)


pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
    -- rename
    mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
    -- code action
    mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
    -- go xx
    mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
    mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
    -- diagnostic
    mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
    mapbuf('n', '<A-Left>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
    mapbuf('n', '<A-Right>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- file formatting
    mapbuf('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
    -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- workspace folder
    mapbuf('n', '<leader>wf', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- search everything
map("n", "<C-t>", ":Telescope live_grep<CR>", opt)
-- 搜symbol
map("n", "<A-\\>", ":Telescope lsp_document_symbols<CR>", opt)

pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-n>"] = "move_selection_next",
        ["<C-p>"] = "move_selection_previous",
        -- 历史记录
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        -- 关闭窗口
        -- ["<esc>"] = actions.close,
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    -- normal 模式
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    -- visual 模式
    opleader = {
        line = 'gc',
        block = 'gb',
    },
}

map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })

return pluginKeys

----------------- 插件快捷键 end -------------------
