-- LSP config
local lsp = require("lsp-zero").preset({
  name = "recommended",
  set_lsp_keymaps = {
    preserve_mappings = false,
    omit = { "<C-k>" },
  },
})

lsp.ensure_installed({
  "tsserver",
  "eslint",
})

vim.keymap.set("n", "<leader>le", ":EslintFixAll<CR>", { desc = "Eslint fix", silent = true })

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

local cmp_action = lsp.cmp_action()

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
  ["<Tab>"] = cmp.mapping.confirm({ select = false }),
  ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
  -- scroll docs
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
}

config.window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
}

cmp.setup(config)

-- diagnostics config
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})

-- toggle virtual_text on <leader>t
local toggle_virtual_text = function()
  if vim.diagnostic.config().virtual_text then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end

vim.keymap.set("n", "<leader>lt", toggle_virtual_text, { desc = "Toggle virtual text" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.hover, { desc = "Show hover" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })

local organize_imports = function()
  vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
end

vim.keymap.set({ "n", "v" }, "<leader>li", organize_imports, { desc = "Organize imports (tsserver)" })
