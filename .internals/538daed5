-- LSP config
local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
end)

lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "",
})

require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {
    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
})

-- cmp config

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

local config = cmp.get_config()

config.sources = {
  { name = "nvim_lsp" },
}

config.formatting = {
  format = function(entry, vim_item)
    -- fancy icons and a name of kind
    vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

    -- set a name for each source
    vim_item.menu = ({
      nvim_lsp = "󰆧",
      nvim_lua = "",
      buffer = "",
    })[entry.source.name]
    return vim_item
  end,
}

config.completion = {
  completeopt = "menu,menuone,noinsert",
  keyword_length = 2,
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
  severity_sort = true,
  float = {
    -- border = "rounded",
    source = "always",
    scope = "cursor",
    header = "",
  },
})

-- toggle virtual_text on <leader>t
local toggle_virtual_text = function()
  if vim.diagnostic.config().virtual_text then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end

local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>lt", toggle_virtual_text, { desc = "Toggle virtual text" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.hover, { desc = "Show hover" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>le", ":EslintFixAll<CR>", { desc = "Eslint fix", silent = true })

local organize_imports = function()
  vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
end

vim.keymap.set({ "n", "v" }, "<leader>li", organize_imports, { desc = "Organize imports (tsserver)" })

lsp.setup()
