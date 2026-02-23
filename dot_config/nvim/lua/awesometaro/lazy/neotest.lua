return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-phpunit",
  },
  config = function()
    -- local rpst_local_maker = "/rpst%-v2/"
    -- local ssh = {
    --   remote_host = "dev-tmorita",
    --   user = "taro_morita",
    --   base_path = "/var/www/rpst-v2/dev",
    --   phpunit_config = "/var/www/rpst-v2/dev/tests/app/phpunit/v9/phpunit.xml.dist",
    -- }
    --
    -- local function is_rpst_buffer()
    --   local file = vim.api.nvim_buf_get_name(0)
    --   return file ~= "" and file:match(rpst_local_maker) ~= nil
    -- end
    --
    -- local function rpst_ssh_phpunit_adaptor()
    --   return require("neotest-phpunit")({
    --     phpunit_cmd = function()
    --       return {
    --         "ssh",
    --         ssh.user .. "@" .. ssh.remote_host,
    --         string.format("php %s/vendor/bin/phpunit -c %s", ssh.base_path, ssh.phpunit_config),
    --       }
    --     end,
    --   })
    -- end
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-phpunit"),
      },
    })
    vim.keymap.set("n", "<leader>tn", function()
      require("neotest").run.run()
    end, { desc = "Run the nearest test" })
    vim.keymap.set(
      "n",
      "<leader>tf",
      '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
      { desc = "Run current file tests" }
    )
    vim.keymap.set(
      "n",
      "<leader>ts",
      '<Cmd>lua require("neotest").summary.toggle()<CR>',
      { desc = "Toggle test summary" }
    )
    -- vim.keymap.set("n", "<leader>tT", function()
    --   if not is_rpst_buffer() then
    --     vim.notify("rpst-v2配下ではないため、PHPUnit(SSH)は無効です", vim.log.levels.WARN)
    --     return
    --   end
    --   local path_map = {
    --     local_root = "/Users/taro_morita/ghq/rpst-v2",
    --     remote_root = "/var/www/rpst-v2/dev",
    --   }
    --
    --   local function to_remote_path(path)
    --     local escaped = path_map.local_root:gsub("([^%w])", "%%%1")
    --     return path:gsub(escaped, path_map.remote_root)
    --   end
    --   local remote_path = to_remote_path(vim.fn.expand("%:p"))
    --   print(vim.fn.expand("%:p"))
    --   print(remote_path)
    --   neotest.run.run(remote_path)
    -- end, { desc = "Run Rpst Unit test" })
  end,
}
