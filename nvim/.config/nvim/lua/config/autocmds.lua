-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Disable autoformat and lsp display for .env file
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { ".env", ".env.local", ".env.debug", "config.env" },
  callback = function()
    vim.bo.filetype = ""
    vim.b.autoformat = false
    vim.diagnostic.enable(false)
  end,
})
