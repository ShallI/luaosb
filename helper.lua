ori_print = print
print = function(...) 
	if type(...) == "table" then
		for k,v in pairs(...) do print(k,v) end
	else
		ori_print(...)
	end
end