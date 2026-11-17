return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- Pin the last 3.18 release while the 3.19 LuaLS series is incompatible
      -- with this Neovim 0.11 environment.
      ensure_installed = { "lua_ls@3.18.2", "basedpyright", "html", "emmet_language_server" },
      automatic_enable = { "lua_ls", "basedpyright", "html", "emmet_language_server" },
    },
  },
}
