local M = {}

local luasnip = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node

-- GENERAL USE
local or_none_equal_none = s("onen", {
	t("| None = None"),
})

-- FASTAPI Snippets
local fastapi_init = s(
	"apii",
	t({
		"import logging",
		"from fastapi import APIRouter",
		"",
		"router = APIRouter()",
		"logger = logging.getLogger(__name__)",
	})
)

local fastapi_get = s(
	"apig",
	fmt(
		[[
    @router.get("/{}", response_model={}, status_code=200, tags = ["{}"])
    async def api_{}(session: AsyncSession = Depends(get_session)) -> {}:
        try: 
            {} = await {} 
            logger.info(f"{}")
            return {}
        except Exception as e:
            logger.error(
                f"{}"
            )
            raise e
]],
		{
			i(1, "URL"),
			i(2, "RETURN_SCHEMA"),
			i(3, "TAG"),
			i(4, "FUNCTION_NAME"),
			i(5, "RETURN_TYPE"),
			i(6, "RESULT"),
			i(7, "CRUD_FUNCTION"),
			i(8, "LOGGER SUCCESS MESSAGE"),
			rep(6),
			i(9, "LOGGER SUCCESS MESSAGE"),
		}
	)
)

local fastapi_post = s(
	"apip",
	fmt(
		[[
    @router.post("/{}", response_model={}, status_code=201, tags = ["{}"])
    async def api_{}({}: {},session: AsyncSession = Depends(get_session)) -> {}:
        try: 
            {} = await {} 
            logger.info(f"{}")
            return {}
        except Exception as e:
            logger.error(
                f"{}"
            )
            raise e
]],
		{
			i(1, "URL"),
			i(2, "RETURN_SCHEMA"),
			i(3, "TAG"),
			i(4, "FUNCTION_NAME"),
			i(5, ""),
			i(6, " "),
			i(7, "RETURN_TYPE"),
			i(8, "RESULT"),
			i(9, "CRUD_FUNCTION"),
			i(10, "LOGGER SUCCESS MESSAGE"),
			rep(8),
			i(11, "LOGGER SUCCESS MESSAGE"),
		}
	)
)

local fastapi_delete = s(
	"apid",
	fmt(
		[[
    @router.delete("/{}", status_code=204, tags = ["{}"])
    async def api_{}({}: {},session: AsyncSession = Depends(get_session)):
        try: 
            r = await {} 
            logger.info(f"{}")
            if not r:
                raise
        except Exception as e:
            logger.error(
                f"{}"
            )
            raise e
]],
		{
			i(1, "URL"),
			i(2, "TAG"),
			i(3, "FUNCTION_NAME"),
			i(4, ""),
			i(5, " "),
			i(6, "CRUD_FUNCTION"),
			i(7, "LOGGER SUCCESS MESSAGE"),
			i(8, "LOGGER SUCCESS MESSAGE"),
		}
	)
)

-- SQLALCHEMY SNIPPETS

local sqlalech_model = s(
	"sqlm",
	fmt(
		[[
        import uuid 
        from datetime import datetime
        from sqlalchemy import DateTime, func
        from sqlalchemy.orm import Mapped, mapped_column

        class {}({}):
            __tablename__ = "{}"
            {}_id: Mapped[uuid.UUID] = mapped_column(primary_key=True, default=uuid.uuid4)

            created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now())
            updated_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), server_onupdate=func.now())
        ]],
		{
			i(1, "TableName"),
			i(2, "BASE_MODEL"),
			i(3, "table_name"),
			i(4, ""),
		}
	)
)

local sqlalch_row = s(
	"sqlr",
	fmt([[{}: {} = {}({})]], {
		i(1, ""),
		i(2, ""),
		i(3, ""),
		i(4, ""),
	})
)

-- PYDANTIC SCHEMAS
local pydantic_init = s(
	"pydi",
	fmt(
		[[
        from pydantic import BaseModel, ConfigDict
        
        class {}Base(BaseModel):
            {}_id: {}
            {}: {}
            {}: {}
            {}: {}
            {}: {}
            {}: {}
            {}: {}

        class {}Update(BaseModel):
            {}: {} | None = None
            {}: {} | None = None
            {}: {} | None = None
            {}: {} | None = None
            {}: {} | None = None
            {}: {} | None = None

        class {}({}Base):
            {}: {}
            {}: {}
            {}: {}
            model_config = ConfigDict(from_attributes=True)

        class {}Create(BaseModel):
            {}: {}
            {}: {}
            {}: {}
            {}: {}
            {}: {}
            {}: {}
        ]],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
			i(4, ""),
			i(5, ""),
			i(6, ""),
			i(7, ""),
			i(8, ""),
			i(9, ""),
			i(10, ""),
			i(11, ""),
			i(12, ""),
			i(13, ""),
			i(14, ""),
			i(15, ""),
			rep(1),
			rep(4),
			rep(5),
			rep(6),
			rep(7),
			rep(8),
			rep(9),
			rep(10),
			rep(11),
			rep(12),
			rep(13),
			rep(14),
			rep(15),
			rep(1),
			rep(1),
			i(16, ""),
			i(17, ""),
			i(18, ""),
			i(19, ""),
			i(20, ""),
			i(21, ""),
			rep(1),
			rep(4),
			rep(5),
			rep(6),
			rep(7),
			rep(8),
			rep(9),
			rep(10),
			rep(11),
			rep(12),
			rep(13),
			rep(14),
			rep(15),
		}
	)
)

M.python_snips = {
	fastapi_get,
	fastapi_post,
	fastapi_delete,
	fastapi_init,
	sqlalch_row,
	sqlalech_model,
	pydantic_init,
	or_none_equal_none,
}

return M
