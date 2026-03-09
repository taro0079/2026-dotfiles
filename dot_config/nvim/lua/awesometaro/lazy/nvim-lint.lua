return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      php = { "phpstan" },
      eruby = { "erb_lint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
