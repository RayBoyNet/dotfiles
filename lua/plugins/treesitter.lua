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
      -- Treesitter indentation remains experimental, so retain Neovim's defaults.
      indent = { enable = false },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
