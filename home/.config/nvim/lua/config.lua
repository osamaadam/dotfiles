local indent = 2

local opts = {
  -- line wrap
  wrap = false,
  -- line numbers
  nu = true,
  relativenumber = true,
  -- indents
  tabstop = indent,
  softtabstop = indent,
  shiftwidth = indent,
  autoindent = true,
  smartindent = true,
  expandtab = true,
  -- less annoying search
  hlsearch = true,
  incsearch = true,
  -- pretty colors
  termguicolors = true,
  -- stay in the middle
  scrolloff = 14,
  -- system clipboard
  clipboard = "unnamedplus",
  -- render whitespace
  -- listchars = "tab:»·,trail:·,nbsp:·",
  list = true,
  -- show cursor line
  cursorline = true,
  -- timoutlen for keymaps
  timeoutlen = 1000,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
