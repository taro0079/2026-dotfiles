return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",

		dependencies = { "rafamadriz/friendly-snippets" },

		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
                path = { vim.fn.stdpath("config") .. "/lua/awesometaro/lazy/snippets" }
            })
			require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/lua/awesometaro/lazy/luasnippets" }
            })
			local ls = require("luasnip")
			-- ls.filetype_extend("javascript", { "jsdoc" })

			--- TODO: What is expand?
			vim.keymap.set({ "i" }, "<C-s>e", function()
				ls.expand()
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-s>;", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-s>,", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local f = ls.function_node

			local function class_name()
				return vim.fn.expand("%:t:r")
			end

			ls.add_snippets("php", {
				s("class", {
					t({
						"<?php",
						"",
						"declare(strict_types=1);",
						"",
						"class ",
					}),
					f(class_name),
					t({
						"",
						"{",
						"}",
					}),
				}),
			})

			-- require("awesometaro.lazy.luasnippets")
		end,
	},
}
