local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local toggle_comment = ':call nerdcommenter#Comment("n", "Toggle")<CR>'
local toggle_comment_insert = "<esc>" .. toggle_comment .. "A"

map("n", "<C-_>", toggle_comment, opts)
map("v", "<C-_>", toggle_comment, opts)
map("i", "<C-_>", toggle_comment_insert, opts)
