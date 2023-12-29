local M = {
    terminal = 'kitty',
    editor   = os.getenv('EDITOR') or 'nano',
}

M.editor_cmd = M.terminal .. ' -e ' .. M.editor
M.manual_cmd = M.terminal .. ' -e man awesome'

return M
