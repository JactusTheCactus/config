.pages
| to_entries
| map(
	.value
	| to_entries
	| map(
		if (
			.key as $key
			| $abilities
			| index($key)
		)
			then .value
			else null
		end
	)
	| map(select(. != null))
)
| map(select(. != []))
| flatten
| map(
	"\t\t"
	+ (.name | match("([\\w\\s]*?)</span></span>$").captures[0].string)
	+ " (" + (
		.description
		| join("")
		| [match("LEFT|RIGHT"; "g").string[:1]]
		| join("")
	) + ")"
)[]
