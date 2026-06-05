local helpers = {}
function helpers.all(conditions)
	for _, v in ipairs(conditions) do
		if not v then
			return false
		end
	end
	return true
end
function helpers.merge(default, overwrite)
	local result = {}
	for k, v in pairs(default or {}) do
		result[k] = v
	end
	for k, v in pairs(overwrite or {}) do
		if helpers.all({
			type(result[k]) == 'table',
			type(v) == 'table',
		}) then
			result[k] = helpers.merge(result[k], v)
		else
			result[k] = v
		end
	end
	return result
end
return helpers
