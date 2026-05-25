[
	"Lvl. "
		+ (.totalLevel | tostring) + " "
		+ ($class | (.[:1] | ascii_upcase) + .[1:]),
	"\tCombat Lvl: "
		+ (.level | tostring)
		+ " (" + (.xpPercent | tostring) + "%)",
	"\tKills: " + (
		.mobsKilled
		+ (.pvp.kills // 0)
		| tostring
	),
	"\t\tMobs: " + (.mobsKilled | tostring),
	"\t\tPlayers: " + (.pvp.kills // 0 | tostring),
	"\tDistance Walked: " + (
		(
			.blocksWalked / 10
			| round / 100
		) | tostring
	) + "km",
	"\tSkill Points:",
	"\t\tSTR: " + (.skillPoints.strength | tostring),
	"\t\tDEX: " + (.skillPoints.dexterity | tostring),
	"\t\tINT: " + (.skillPoints.intelligence | tostring),
	"\t\tDEF: " + (.skillPoints.defense | tostring),
	"\t\tAGI: " + (.skillPoints.agility | tostring)
][]
