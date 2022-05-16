---- Plugins Here ----
return require('packer').startup(function(use)
  --packer
  use 'wbthomason/packer.nvim'
  --treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function () require("plug_confs.treesitter") end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  --lsp
  use {
    'neovim/nvim-lspconfig',
    config = function () require("plug_confs.lspconfig") end,
  }
  --auto complete
  use {
    'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lua'
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function () require("plug_confs.cmp") end,
    requires = {
      {'L3MON4D3/LuaSnip'},        --used in config
      {'onsails/lspkind.nvim'},    --used in config
    },
    --after = 'LuaSnip',
  }
  --snippet luasnip
  use {
    'L3MON4D3/LuaSnip',
    --after = 'nvim-cmp',
    config = function () require("plug_confs.luasnip") end,
    requires = {'rafamadriz/friendly-snippets'},
  }
  --colorschemes
  use 'ishan9299/nvim-solarized-lua'
  --lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function () require("plug_confs.lualine") end,
  }
  --gitgutter
  use 'airblade/vim-gitgutter'
  --fugitive
  use 'tpope/vim-fugitive'
  -- commentary
  use 'tpope/vim-commentary'
  -- show indent level
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function () require("plug_confs.indent_blankline") end,
  }
  -- keymap helper
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {}
    end
  }
  -- smooth scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require("neoscroll").setup {
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

