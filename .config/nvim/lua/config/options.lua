-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local g, opt = vim.g, vim.opt

if g.neovide then
  opt.guifont = "JetBrainsMono Nerd Font:h9"
  opt.linespace = 2
  g.neovide_cursor_vfx_mode = "railgun"
end
