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
    enabled = false,
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
  custom_highlights = function(colors)
    return {
      CursorLine = { bg = colors.mantle },
      CursorLineNr = { bg = colors.mantle },
    }
  end,
  integrations = {
    cmp = true,
    gitsigns = true,
    telescope = true,
    illuminate = true,
    mason = true,
    neotree = true,
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
