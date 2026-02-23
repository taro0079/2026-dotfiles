if not vim.g.vscode then
    require("remap")
    require("options")
    require("transport_rpst")
    require("lazy_init")
    require("awesometaro")
    require("toggle_term")
    -- require("kurodake-green")
end

if vim.g.vscode then
    -- require("remap")
    vim.opt.clipboard = "unnamedplus"
    vim.keymap.set("n", "<leader>o", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
    vim.keymap.set("n", "<leader>vrn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
    vim.keymap.set("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>")
    vim.keymap.set("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>")
end
