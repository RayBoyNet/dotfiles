return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Extend nvim-lspconfig's lua_ls defaults using Neovim's native LSP API.
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- Keep interpreter and import-path choices in each Python project (or
      -- its active environment), rather than pinning this shared config to one
      -- machine's virtual environment.
      vim.lsp.config("basedpyright", {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/basedpyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "pyrightconfig.json", ".git" },
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              -- BasedPyright supplies these labels; Neovim displays them below.
              inlayHints = { callArgumentNames = true },
            },
          },
        },
      })
      vim.lsp.enable("basedpyright")

      -- Use Ruff's language server for Python linting. Formatting remains
      -- managed by conform.nvim.
      vim.lsp.config("ruff", {
        cmd = { "ruff", "server" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      })
      vim.lsp.enable("ruff")

      -- Emmet expands abbreviations such as `!` in HTML and related files.
      vim.lsp.config("emmet_language_server", {
        filetypes = {
          "html",
          "htmldjango",
          "css",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "svelte",
        },
      })
      vim.lsp.enable("emmet_language_server")

      vim.lsp.config("html", {
        filetypes = { "html", "htmldjango" },
      })
      vim.lsp.enable("html")
    end,
  },
}
