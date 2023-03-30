-- LSP config
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- cmp config

local cmp = require("cmp")

local config = cmp.get_config()

config.mapping = {
  -- toggle completion menu
  ["<C-e>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.abort()
      fallback()
    else
      cmp.complete()
    end
  end),
  -- accept completion on tab.
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
    elseif require("luasnip").expand_or_jumpable() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}

cmp.setup(config)

-- diagnostics config
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})

-- show diagnostics in a floating window
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { noremap = true, silent = true })
-- toggle virtual_text on <leader>t
local toggle_virtual_text = function()
  if vim.diagnostic.config().virtual_text then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>lt", toggle_virtual_text, opts)
-- show signature on <leader>s
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.hover, opts)
-- go to next error on <leader>le
vim.keymap.set("n", "<leader>le", vim.diagnostic.goto_next, opts)
-- lsp code action
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
-- lsp rename
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
