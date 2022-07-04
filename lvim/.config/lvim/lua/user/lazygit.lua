local M = {}

M.config = function()
  local status_ok, lazygit = pcall(require, "lazygit")
  if not status_ok then
    return
  end
  lazygit.setup()
  vim.api.nvim_set_keymap("", "<Space>gg", ":LazyGit<cr>", { silent = true })
end

return M

