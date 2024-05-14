require("lualine").setup({
  options = {
    theme = "catppuccin",
    icons_enabled = true,
  },
  extensions = { "fugitive", "neo-tree", "toggleterm", "man" },
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
    },
  },
})
