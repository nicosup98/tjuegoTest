local ClassCreate ={}
ClassCreate.__call = ClassCreate
function ClassCreate:new()
end

function ClassCreate:derive(type)
    local class = {}
    class.type = type
    class.__index = class
    class.super = self
    setmetatable(class,self)
    return class
end

function ClassCreate:__call(...)
   local instanse = setmetatable({},self)
   instanse:new(...)
   return instanse
end

return ClassCreate