local status_ok, npairs = pcall(require, "rose-pine")
if not status_ok then
  return
end

npairs.setup({disable_background = true})

function Colors(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colors()
