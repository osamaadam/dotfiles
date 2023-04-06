require("ayu").setup({
  mirage = true,
})
vim.cmd([[colorscheme ayu-mirage]])

function _G.TransparentBackground()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

TransparentBackground()
