local M = {}

local luasnip = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node

local sql_select = s(
	"ss",
	fmt(
		[[
        select {} from "{}";]],
		{

			i(1, ""),
			i(2, ""),
		}
	)
)

local sql_select_where = s(
	"sw",
	fmt([[select {} from "{}" where {};]], {

		i(1, ""),
		i(2, ""),
		i(3, ""),
	})
)

local sql_select_where_group_by = s(
	"swo",
	fmt([[select {} from "{}" where {} group_by {};]], {

		i(1, ""),
		i(2, ""),
		i(3, ""),
		i(4, ""),
	})
)

local sql_select_where_group_by_order_by = s(
	"swgo",
	fmt([[select {} from "{}" where {} group_by {} order_by {};]], {

		i(1, ""),
		i(2, ""),
		i(3, ""),
		i(4, ""),
		i(5, ""),
	})
)

M.sql_snips = {
	sql_select,
	sql_select_where,
	sql_select_where_group_by,
	sql_select_where_group_by_order_by,
}

return M
