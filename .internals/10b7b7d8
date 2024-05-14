local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("tpope/vim-surround")
    use("tpope/vim-sleuth")
    use("raimondi/delimitmate")
    use("akinsho/toggleterm.nvim")
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")
    use("nvim-lualine/lualine.nvim")
    use("mhartington/formatter.nvim")
    use("fladson/vim-kitty")
    use("folke/todo-comments.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("eslint/eslint")
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({
          toggler = {
            line = "<leader>cc",
          },
          opleader = {
            line = "<leader>cc",
          },
        })
      end,
    })
    use({
      "catppuccin/nvim",
      as = "catppuccin",
    })
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    })
    use({
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    })
    use({
      "RRethy/vim-illuminate",
      config = function()
        require("illuminate").configure({
          providers = {
            "lsp",
            "treesitter",
          },
          delay = 100,
        })
      end,
    })
    use({
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup()
      end,
    })
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("sindrets/diffview.nvim")
    -- neo-tree
    use({
      "nvim-neo-tree/neo-tree.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
    })

    -- Copilot
    use({
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
            keymap = {
              accept = "<C-w>",
            },
          },
          filetypes = {
            ["*"] = true,
          },
        })
      end,
    })

    -- LSP stuff
    use({
      "VonHeikemen/lsp-zero.nvim",
      branch = "v3.x",
      requires = {
        -- LSP Support
        { "neovim/nvim-lspconfig" }, -- Required
        { "williamboman/mason.nvim" }, -- Optional
        { "williamboman/mason-lspconfig.nvim" }, -- Optional

        -- Autocompletion
        { "hrsh7th/nvim-cmp" }, -- Required
        { "hrsh7th/cmp-nvim-lsp" }, -- Required
        { "hrsh7th/cmp-nvim-lua" }, -- Optional
        { "hrsh7th/cmp-buffer" }, -- Optional
        { "hrsh7th/cmp-path" }, -- Optional
        { "saadparwaiz1/cmp_luasnip" }, -- Optional
        { "onsails/lspkind.nvim" },

        -- Snippets
        { "L3MON4D3/LuaSnip" }, -- Required
        { "rafamadriz/friendly-snippets" }, -- Optional
      },
    })

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
