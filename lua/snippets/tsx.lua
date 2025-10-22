local M = {}

local luasnip = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = luasnip.snippet
local i = luasnip.insert_node
local f = luasnip.function_node

local function pascal(args)
	local v = (args[1] and args[1][1]) or ""
	return v ~= "" and (v:sub(1, 1):upper() .. v:sub(2)) or ""
end

--- REACT

local usestate = s(
	"tsus",
	fmt("const [{}, set{}] = useState<{}>({})", {
		i(1, "state"),
		f(pascal, { 1 }),
		i(2, "Type"),
		i(3, "initial"),
	})
)

local test = s("test", luasnip.text_node({ "test work" }))
M.tsx_snips = { usestate, test }

return M
