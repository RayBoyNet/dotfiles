-- vim.opt is Lua's interface to Neovim's built-in options.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.wrap = false

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.breakindent = true

-- Use spaces with a four-space default; language-specific conventions are
-- applied below (Lua commonly uses two spaces).
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

local indent_group = vim.api.nvim_create_augroup("LanguageIndentation", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
  end,
})

-- Use the Windows clipboard by default when the WSL provider is available.
if vim.g.clipboard then
  vim.opt.clipboard = "unnamedplus"
end
