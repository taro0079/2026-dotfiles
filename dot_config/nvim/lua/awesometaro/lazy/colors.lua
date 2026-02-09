function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	-- color = color or "kurodake-green"
	vim.cmd.colorscheme(color)

	-- kurodake-green uses its own background, don't override it
	if color ~= "kurodake-green" then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

return {
	{
		"erikbackman/brightburn.vim"
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_color = true,
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_indentguides = false,
				inverse = true,
				contrast = "",
				pallette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false
			})
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false
				},
			})

			ColorMyPencils("kurodake-green");
		end
	}

}

