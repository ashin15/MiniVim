return {
   {
      "wbthomason/packer.nvim",
      setup = function()
         require("core.mappings").packer()
      end,
   },

   -- TODO: Remove this when https://github.com/neovim/neovim/pull/15436 gets into upstream
   {
      "lewis6991/impatient.nvim",
      config = function()
         require("impatient").enable_profile()
      end,
   },

   -- NOTE: issue https://github.com/neovim/neovim/issues/12587 is still open
   { "antoinemadec/FixCursorHold.nvim" },

   -- NOTE: faster version of filetype.vim
   { "nathom/filetype.nvim" },

   -- Colorscheme
   {
      "NTBBloodbath/doom-one.nvim",
   },

   {
      "tiagovla/tokyodark.nvim",
   },

   -- Dashboard
   {
      "goolord/alpha-nvim",
      event = "BufWinEnter",
      config = function()
         require "modules.configs.alpha"
      end,
   },

   -- Statusline
   {
      "rebelot/heirline.nvim",
      event = "BufWinEnter",
      config = function()
         require "modules.configs.statusline"
      end,
   },

   -- Bufferline
   {
      "jose-elias-alvarez/buftabline.nvim",
      event = "BufWinEnter",
      config = function()
         require("buftabline").setup {}
      end,
   },

   -- All important lua functions
   {
      "nvim-lua/plenary.nvim",
      module = "plenary",
   },

   -- Completion engine
   {
      "hrsh7th/nvim-cmp",
      modules = "cmp",
      config = function()
         require "modules.configs.cmp"
      end,
      requires = {
         { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
         "hrsh7th/cmp-emoji",
         "hrsh7th/cmp-path",
         "saadparwaiz1/cmp_luasnip",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-nvim-lua",
         "hrsh7th/cmp-calc",
         "hrsh7th/cmp-cmdline",
         { "onsails/lspkind-nvim", modules = "lspkind" },
      },
   },

   -- Snippets
   {
      "L3MON4D3/LuaSnip",
      after = "nvim-cmp",
      wants = "friendly-snippets",
      requires = {
         {
            "rafamadriz/friendly-snippets",
         },
      },
      config = function()
         require("modules.configs.others").luasnip()
      end,
   },

   -- Neovim Lsp
   {
      "neovim/nvim-lspconfig",
      event = "BufRead",
   },

   {
      "williamboman/nvim-lsp-installer",
      event = "BufRead",
   },

   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("modules.configs.null_ls").setup()
      end,
   },

   {
      "ray-x/lsp_signature.nvim",
      module = "lsp_signature",
      config = function()
         require("modules.configs.others").signature()
      end,
   },

   {
      "j-hui/fidget.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("fidget").setup {}
      end,
   },

   -- Autopairs
   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
         require("modules.configs.others").autopairs()
      end,
   },

   -- Icons
   {
      "kyazdani42/nvim-web-devicons",
      setup = function()
         require("core.utils").lazy_load "nvim-web-devicons"
      end,
   },

   -- Syntax parser and more
   {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
         require "modules.configs.treesitter"
      end,
   },

   -- Commenter
   {
      "numToStr/Comment.nvim",
      after = "nvim-treesitter",
      config = function()
         require("Comment").setup {}
      end,
   },

   -- Annotations generator
   {
      "danymat/neogen",
      module = "neogen",
      config = function()
         require("neogen").setup {
            enabled = true,
         }
      end,
   },

   -- More than a fuzzy finder
   {
      "nvim-telescope/telescope.nvim",
      requires = {
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
         },
      },
      config = function()
         require "modules.configs.telescope"
      end,
      setup = function()
         require("core.mappings").telescope()
      end,
   },

   {
      "nvim-orgmode/orgmode",
      ft = { "org" },
      config = function()
         require "modules.configs.orgmode"
      end,
      requires = {
         {
            "akinsho/org-bullets.nvim",
            config = function()
               require("org-bullets").setup {}
            end,
         },
      },
   },

   {
      "davidgranstrom/nvim-markdown-preview",
      ft = "markdown",
   },

   -- Zen mode

   -- Magit like neogit
   --[[ {
      "TimUntersberger/neogit",
      module = "neogit",
      cmd = "Neogit",
      setup = function()
         require("core.mappings").neogit()
      end,
   }, ]]

   -- Notifier for neovim
   {
      "rcarriga/nvim-notify",
      event = "BufWinEnter",
      config = function()
         require("notify").setup {
            timeout = 1000,
         }
      end,
   },

   -- Gitsigns and diffs
   {
      "lewis6991/gitsigns.nvim",
      module = "gitsigns",
      setup = function()
         require("core.utils").lazy_load "gitsigns.nvim"
      end,
      config = function()
         require "modules.configs.gitsigns"
      end,
   },

   -- Code runner
   {
      "michaelb/sniprun",
      run = "bash ./install.sh",
      cmd = "SnipRun",
      module = "sniprun",
   },

   -- Math calc
   {
      "max397574/vmath.nvim",
      cmd = "Vmath",
      config = function()
         require("vmath_nvim").init()
      end,
   },

   -- HEX code colorizer
   {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
         require("modules.configs.others").colorizer()
      end,
   },

   -- Match Parens
   {
      "andymass/vim-matchup",
      setup = function()
         require("core.utils").lazy_load "gitsigns.nvim"
      end,
   },

   -- Lightspeed motion
   {
      "ggandor/lightspeed.nvim",
      after = "gitsigns.nvim",
      config = function()
         require("lightspeed").setup {}
      end,
   },

   -- Nvim Tree
   {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
      config = function()
         require "modules.configs.nvimtree"
      end,
      setup = function()
         require("core.mappings").nvimtree()
      end,
   },
}
