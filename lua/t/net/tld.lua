local psl=require "public_suffix_list"
local t=t or require "t"
local ok={string=true}
return setmetatable({},{
__call=function(self, host)
  if not (ok[type(host)] and #host>0) then return end
  local rv=host:lower():strip('.'):split('.') or {}
  setmetatable(rv,getmetatable(self))
  while #rv>0 do
    if psl.exists(tostring(rv)) then return rv end
    table.remove(rv, 1)
  end
end,
__export=function(self)
  if #self>0 then return table.concat(self, '.') end
end,
__tostring=function(self)
  return table.concat(self, '.') or ''
end,
__eq = function(a, b)
  return tostring(a)==tostring(b)
end,
})