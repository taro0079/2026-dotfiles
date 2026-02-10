local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node
local rep = require("luasnip.extras").rep

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

		t({ "/**", " * " }),
		i(1, ":property"),
		t("を取得します", ""),
		t({ "", " *", " * @return " }),
		i(2, "string"),
		t(" "),
		rep(1),
		t({ "", " */", "public function " }),
		d(4, function(args)
			local type_ = args[1][1]
			local name = args[2][1]
			local prefix = type_ == "bool" and "is" or "get"

			return sn(nil, {
				t(prefix .. name:sub(1, 1):upper() .. name:sub(2)),
			})
		end, { 2, 3 }),
		-- f(function(args)
		-- 	local name = (args[1] and args[1][1]) or "property"
		-- 	return "get" .. name:sub(1, 1):upper() .. name:sub(2)
		-- end, { 2 }),
		t("(): "),
		f(function(args)
			local text = (args[1] and args[1][1]) or "mixed"
			return vim.split(vim.trim(text), "%s+")[1] or "mixed"
		end, { 2 }),
		t({ "", "{", "    return $this->" }),
		i(3, "property"),
		t({ ";", "}" }),
	}),
	s("doc", {
		t({ "/**", " * " }),
		i(1, "document"),
		t({ "", " */" }),
	}),
})
