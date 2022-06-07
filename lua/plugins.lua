return require('packer').startup(function(use)
    -- Packer can manage itself 插件管理
    use 'wbthomason/packer.nvim'
    -- nvim-tree 提供文件导航
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- bufferline 提供标签页
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("arkav/lualine-lsp-progress")
    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'
    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- indent-blankline
    use "lukas-reineke/indent-blankline.nvim"
    -- surround
    use("ur4ltz/surround.nvim")
    -- Comment
    use("numToStr/Comment.nvim")
    -- nvim-autopairs
    use("windwp/nvim-autopairs")
    -- vimspector
    use("puremourning/vimspector")
    -- 代码格式化
    use("mhartington/formatter.nvim")
    -- Lua 增强
    use("folke/lua-dev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")
    --------------------------------------
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    use("j-hui/fidget.nvim")

    ---------------- colorschemes --------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- zephyr theme 颜色主题
    use {
        "glepnir/zephyr-nvim",
    }
    use "Pocco81/AutoSave.nvim"
end)
