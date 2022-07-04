
local M = {}

M.config = function()
  local status_ok, beacon = pcall(require, "beacon")
  if not status_ok then
    return
  end
  beacon.setup()
end

return M

