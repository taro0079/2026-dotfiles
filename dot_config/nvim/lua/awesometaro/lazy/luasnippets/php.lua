local ls = require("luasnip")
local s  = ls.snippet
local i  = ls.insert_node
local t  = ls.text_node
local f  = ls.function_node

local generate_phpdoc = function(args)
  local lines = { "/**", " * Method description" }

  local param_str = (args[1] and args[1][1]) or ""
  local params = vim.split(param_str, ",", { trimempty = true })

  for _, param in ipairs(params) do
    param = vim.trim(param)

    local type_part, name_part = param:match("^%s*([^%$]+)%s+(%$[%w_]+)")
    if not name_part then
      name_part = param:match("(%$[%w_]+)")
      type_part = "mixed"
    else
      type_part = vim.trim(type_part)
    end

    if name_part then
      table.insert(lines, " * @param " .. type_part .. " " .. name_part)
    end
  end

  table.insert(lines, " */")
  return lines
end

ls.add_snippets("php", {
  s("pmeth", {
    f(generate_phpdoc, { 1 }),
    t({ "", "public function " }),
    i(2, "methodName"),
    t("("),
    i(1, "string $arg1, int $arg2"),
    t({ ") {", "    " }),
    i(0),
    t({ "", "}" }),
  }),

  s("getter", {
    t({ "/**", " * @return " }),
    i(1, "string"),
    t({ "", " */", "public function " }),
    f(function(args)
      local name = (args[1] and args[1][1]) or "property"
      return "get" .. name:sub(1, 1):upper() .. name:sub(2)
    end, { 2 }),
    t("(): "),
    f(function(args)
      local text = (args[1] and args[1][1]) or "mixed"
      return vim.split(vim.trim(text), "%s+")[1] or "mixed"
    end, { 1 }),
    t({ "", "{", "    return $this->" }),
    i(2, "property"),
    t({ ";", "}" }),
  }),
})
