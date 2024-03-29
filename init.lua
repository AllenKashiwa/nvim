-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 插件配置
require("plugin-config.comment")
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.surround")
require("plugin-config.nvim-autopairs")
require("plugin-config.fidget")
require("plugin-config.vim-vsnip")
require("plugin-config.which-key")
require("plugin-config.nvim-session-manager")
-- 内置LSP
require("lsp.setup")
require("lsp.nvim-cmp")
