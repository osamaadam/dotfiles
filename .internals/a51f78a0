require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    telescope = true,
    illuminate = true,
    mason = true,
    cmp = true,
    neotree = true,
    which_key = true,
  },
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

-- function _G.TransparentBackground()
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   vim.cmd("hi IlluminatedWordRead guibg=#3a3a3a gui=NONE")
-- end
--
-- TransparentBackground()
