-- Install lazy.nvim into Neovim's user data directory on first launch.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repository = "https://github.com/folke/lazy.nvim.git"
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    repository,
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Could not clone lazy.nvim:\n" .. result)
  end
end

-- Make lazy.nvim available to Lua before requiring it.
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  change_detection = { notify = false },
})
