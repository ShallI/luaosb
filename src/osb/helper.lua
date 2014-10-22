ori_print = print
print = function(...) 
	if type(...) == "table" then
		if select(1,...).__class then
			ori_print(...) 
		end
		for k,v in pairs(...) do ori_print(k,v) end
	else
		ori_print(...)
	end
end
deepprint = function(...) 
	if type(...) == "table" then
		if select(1,...).__class then
			ori_print(...) 
		end
		for k,v in pairs(...) do print(k,v) end
	else
		ori_print(...)
	end
end

object = {}
classtable = {}
classcount = 0
object.new = function(self,classname) --with classname regard as inherting
	local obj = {}
	self.__index = self
	self.__class = self
	if classname then
		classcount = classcount + 1
		classtable[self] = classname or ("cls_"..classcount)
	end
	setmetatable(obj,self)
	return obj
end
