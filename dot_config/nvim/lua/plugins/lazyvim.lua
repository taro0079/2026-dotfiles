return {
  { "ellisonleao/gruvbox.nvim", opts = {
    transparent_mode = true,
  } },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon",
        dim_inactive_windows = false,
        styles = {
          transparency = true,
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
