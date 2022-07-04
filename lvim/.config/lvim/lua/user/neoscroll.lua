local M = {}

M.config = function()
  local status_ok, neoscroll = pcall(require, "neoscroll")
  if not status_ok then
    return
  end

  neoscroll.setup({
    easing_function = "quadratic"
  })
end

return M

