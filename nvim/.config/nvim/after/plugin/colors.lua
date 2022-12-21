require('rose-pine').setup({disable_background = true})

function Colors(color)
--	color = color or "rose-pine"
	color = "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colors()
