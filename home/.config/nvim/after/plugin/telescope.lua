require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--ignore-file",
      ".gitignore",
      "-u",
      "-L",
    },
    file_ignore_patterns = {
      "node_modules/",
      ".git/",
      ".cache/",
    },
  },
})

local telescopeOpts = { follow = true }
local opts = { noremap = true, silent = true }

local builtin = require("telescope/builtin")

vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files(telescopeOpts)
end, opts)
vim.keymap.set("n", "<C-p>", function()
  builtin.find_files(telescopeOpts)
end, opts)

vim.keymap.set("n", "<leader>fg", function()
  builtin.live_grep(telescopeOpts)
end, opts)

vim.keymap.set("n", "<leader>fc", builtin.commands, opts)
vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts)
vim.keymap.set("n", "<leader>fmp", builtin.man_pages, opts)
