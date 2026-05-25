[.[] | select(.type == "ability")]
| map(
	.meta.id
	| select(
		test("(?:\\d|Path)$")
		or
		test("wandProficiency|wisdom|shootingStar")
		| not
	)
)
