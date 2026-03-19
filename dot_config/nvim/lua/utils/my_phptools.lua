local M = {}

function M.insert_var_dump(mode)
  local text = ""

  if mode == "v" then
    local saved_reg = vim.fn.getreg("v")
    vim.cmd('noau normal! "vy')
    text = vim.fn.getreg("v")
    vim.fn.setreg("v", saved_reg)
  else
    text = vim.fn.expand("<cword>")
    if text == "" then
      vim.notify("カーソル下に変数がありません", vim.log.levels.WARN)
      return
    end
  end

  local debug_str = string.format("var_dump(%s);", text)

  local current_line = vim.api.nvim_get_current_line()
  local indent = string.match(current_line, "^%s*") or ""

  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, { indent .. debug_str })
  vim.api.nvim_win_set_cursor(0, { row + 1, #(indent .. debug_str) })
end

vim.keymap.set("n", "<leader>mvd", function()
  M.insert_var_dump("n")
end, { desc = "Insert var_dump for cursor word" })

vim.keymap.set("v", "<leader>mvd", function()
  M.insert_var_dump("v")
end, { desc = "Insert var_dump for cursor word" })
return M
