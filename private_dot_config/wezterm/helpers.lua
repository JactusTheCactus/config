local helpers = {}
function helpers.table_type(t)
	if type(t) ~= 'table' then return 'not-a-table' end
	for k in pairs(t) do
		if type(k) == 'string' then
			return 'associative'
		elseif type(k) == 'number' then
			return 'indexed'
		end
	end
	return 'empty'
end
function helpers.all(conditions)
	for _, v in ipairs(conditions) do
		if not v then return false end
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
function helpers.map(tbl, f)
	local t = {}
	t = helpers.table_type(tbl)
	if t == 'indexed' then
		for i, v in ipairs(tbl) do
			t[i] = f(v)
		end
	elseif t == 'associative' then
		for k, v in pairs(tbl) do
			t[k] = f(v, k)
		end
	elseif t == 'not-a-table' then
		error(string.format('[ERR]: %s is not a table', tostring(tbl)))
	end
	return t
end
return helpers
