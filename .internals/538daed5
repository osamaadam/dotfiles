-- LSP config
local lsp = require("lsp-zero")
lsp.preset("recommended")

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- cmp config

local cmp = require("cmp")

local config = cmp.get_config()

config.formatting = {
  format = function(entry, vim_item)
    -- fancy icons and a name of kind
    vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

    -- set a name for each source
    vim_item.menu = ({
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      buffer = "[Buffer]",
    })[entry.source.name]
    return vim_item
  end,
}

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
  -- scroll docs
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
}

cmp.setup(config)

-- diagnostics config
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})

-- show diagnostics in a floating window
vim.keymap.set(
  "n",
  "<leader>ld",
  vim.diagnostic.open_float,
  { noremap = true, silent = true, desc = "Show diagnostics" }
)
-- toggle virtual_text on <leader>t
local toggle_virtual_text = function()
  if vim.diagnostic.config().virtual_text then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end

vim.keymap.set("n", "<leader>lt", toggle_virtual_text, { noremap = true, silent = true, desc = "Toggle virtual text" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show hover" })
vim.keymap.set(
  "n",
  "<leader>le",
  vim.diagnostic.goto_next,
  { noremap = true, silent = true, desc = "Go to next diagnostic" }
)
vim.keymap.set(
  "n",
  "<leader>lE",
  vim.diagnostic.goto_prev,
  { noremap = true, silent = true, desc = "Go to previous diagnostic" }
)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
