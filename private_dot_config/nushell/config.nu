# You can pretty-print and page through the documentation for configuration options using:
# 	config nu --doc | nu-highlight | less -R
$env.PATH = ([
	...$env.PATH
	~/bin
] | each {str replace '~' $env.HOME})
$env.config.show_banner = false
$env.EDITOR = "hx"
$env.PROMPT_COMMAND = {||
	let white = (ansi white_bold)
	let green = (ansi light_green_bold)
	let red = (ansi light_red_bold)
	let blue = (ansi light_blue_bold)
	let code = if $env.LAST_EXIT_CODE != 0 {
		$"($white)\(($red)($env.LAST_EXIT_CODE)($white)) "
	} else {
		""
	}
	let info = $"($code)($white)[($green)($env.user)@((sys host).hostname)($white)]"
	let dir = $"($blue)($env.PWD | str replace $env.HOME '~')"
	let sigil = $"($green)(if (is-admin) {'#'} else {'$'})(ansi reset)"
	$"($info) ($dir) ($sigil) "
}
$env.PROMPT_INDICATOR = ''
$env.PROMPT_COMMAND_RIGHT = {||
	let date = '%A %B %-d, %Y'
	let time = [%-H %M %S] | str join :
	let fmt = [$date $time] | str join ' | '
	date now | format date $fmt
}
$env.LC_ALL = "en_GB.UTF-8"
def tree [...@ --all (-a)] {
	(^tree ...$@
		-CF(if $all {"a"})
		--dirsfirst
		--noreport
	) | str replace $env.HOME '~'
}
