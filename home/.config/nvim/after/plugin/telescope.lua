require("telescope").setup({
  defaults = {
    path_display = { "truncate" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-u",
      "-L",
      -- "--ignore-file",
      -- ".gitignore",
    },
    file_ignore_patterns = {
      "node_modules/",
      ".git/",
      ".cache/",
      ".vscode/",
      ".idea/",
      "dist/",
      "build/",
      "vendor/",
    },
  },
  pickers = {
    find_files = {
      follow = true,
      hidden = true,
      no_ignore = true,
    },
    git_status = {
      show_untracked = true,
      git_icons = {
        added = "",
        modified = "",
        removed = "",
        renamed = "",
        unmerged = "",
        untracked = "",
      },
    },
  },
})

local builtin = require("telescope/builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })
vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true, desc = "Grep in files" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { noremap = true, silent = true, desc = "Find commands" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { noremap = true, silent = true, desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fmp", builtin.man_pages, { noremap = true, silent = true, desc = "Find Man Pages" })
