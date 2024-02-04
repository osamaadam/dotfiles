local function filetype_default(filetype, formatter)
  return require("formatter.filetypes." .. filetype)[formatter]
end

local types_map = {
  lua = { "lua", "stylua" },
  go = { "go", "goimports" },
  python = { "python", "black" },
  javascript = { "javascript", "prettier" },
  typescript = { "typescript", "prettier" },
  typescriptreact = { "typescriptreact", "prettier" },
  javascriptreact = { "javascriptreact", "prettier" },
  html = { "html", "prettier" },
  css = { "css", "prettier" },
  scss = { "css", "prettier" },
  sass = { "css", "prettier" },
  ruby = { "ruby", "rubocop" },
  eruby = { "html", "prettier" },
  markdown = { "markdown", "prettier" },
  graphql = { "graphql", "prettier" },
  yaml = { "yaml", "prettier" },
  json = { "json", "prettier" },
  sh = { "sh", "shfmt" },
  ["*"] = { "any", "remove_trailing_whitespace" },
}

local filetype = {}

for file_type, v in pairs(types_map) do
  local lang, formatter = v[1], v[2]
  filetype[file_type] = filetype_default(lang, formatter)
end

-- filetype["*"] = { vim.lsp.buf.format }

require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = filetype,
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, desc = "Format" }

map("n", "<leader>lf", ":Format<CR>", opts)

-- format on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]])
