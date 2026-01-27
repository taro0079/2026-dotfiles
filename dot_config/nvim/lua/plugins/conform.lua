-- conform.nvim設定
-- php-cs-fixerで除外設定を正しく動作させるための設定
return {
  {
    "stevearc/conform.nvim",
    opts = {
      log_level = vim.log.levels.DEBUG,
      formatters = {
        php_cs_fixer = {
          command = "php-cs-fixer",
          args = {
            "fix",
            "--path-mode=intersection",
            "$FILENAME",
          },
          stdin = false,
          tmpfile_format = "$FILENAME",
        },
        -- yamlfmt = {
        --   prepend_args = { "-i", "4" },
        -- },
      },
      formatters_by_ft = {
        yaml = { "yamlfmt" },
        yml = { "yamlfmt" },
      },
    },
  },
}
