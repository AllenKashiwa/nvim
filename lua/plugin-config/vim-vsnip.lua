-- 设置vsnip的保存路径在nvim配置文件下，这样在所有设备上拉取配置文件这个repo就能同步拿到所有snippet
vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/.vsnip/'
