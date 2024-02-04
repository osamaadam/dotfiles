require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  shade_terminals = false,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  start_in_insert = true,
  persist_size = false,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = true,
  float_opts = {
    border = "curved",
  },
})

-- Normal mode in terminal.
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = 0 })
