-- A named group lets this configuration own and replace its autocommands.
local highlight_group = vim.api.nvim_create_augroup("HighlightYank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_group,
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Briefly highlight yanked text",
})

local resize_group = vim.api.nvim_create_augroup("EqualizeSplits", { clear = true })

vim.api.nvim_create_autocmd("VimResized", {
  group = resize_group,
  command = "wincmd =",
  desc = "Equalize split sizes after terminal resize",
})

local lsp_group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- BasedPyright provides Python argument-name inlay hints; Neovim renders them.
    if client
      and client.name == "basedpyright"
      and client:supports_method("textDocument/inlayHint", event.buf)
    then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end

    local map = function(keys, action, description)
      vim.keymap.set("n", keys, action, {
        buffer = event.buf,
        desc = "LSP: " .. description,
      })
    end

    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gr", vim.lsp.buf.references, "Find references")
    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")

  end,
  desc = "Add LSP keymaps when a language server attaches",
})
