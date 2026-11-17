-- init.lua is Neovim's entry point.  Keep it small: it only loads modules.
-- These must be set before loading mappings that use <leader>.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.clipboard")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
