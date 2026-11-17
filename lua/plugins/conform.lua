return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
      formatters_by_ft = {
        html = { "prettier" },
        python = { "ruff_format" },
      },
      format_on_save = {
        lsp_fallback = false,
        timeout_ms = 500,
      },
    },
  },
}
