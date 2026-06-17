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
		if helpers.all(helpers.map(
			{ result[k], v },
			function(x) return type(x) == 'table' end
		)) then
			result[k] = helpers.merge(result[k], v)
		else
			result[k] = v
		end
	end
	return result
end
function helpers.map(arr, f)
	local t = {}
	for i, v in ipairs(arr) do
		t[i] = f(v)
	end
	return t
end
return helpers
