local helpers = {}
function helpers.all(conditions)
	for _, v in ipairs(conditions)
		do if not v then return false end
	end
	return true
end
return helpers
