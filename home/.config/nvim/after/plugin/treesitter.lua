require("nvim-treesitter.configs").setup({
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  disable = function(lang, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 500000
  end,
})
