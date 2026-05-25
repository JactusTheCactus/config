"Playtime: " + (
	.playtime
	| floor as $n
	| ($n | tostring) + "h"
	+ ((. - $n) * 60 | tostring) + "m"
)
