require("remaps")
require("theme")
require("config")
require("plugins")

vim.cmd([[filetype plugin on]])
vim.api.nvim_set_option("encoding", "UTF8")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])
