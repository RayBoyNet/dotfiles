return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Neovim 0.11 uses the maintained compatibility branch.
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "yaml",
        "python",
      },
      auto_install = true,
      highlight = { enable = true },
      -- Expand or shrink a visual selection along syntax-tree nodes.
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      -- Treesitter indentation remains experimental, so retain Neovim's defaults.
      indent = { enable = false },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
