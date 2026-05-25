use readline-binding
set edit:prompt = {
	var id = (styled $E:USER@(cat /etc/hostname) bright-green)
	var dir = (styled (tilde-abbr $pwd) bright-blue)
	var sigil = (styled ^
		(if (eq $E:USER root) {
			put "#"
		} else {
			put "$"
		}) ^
	bright-green)
	styled "["$id"] "$dir" "$sigil" " bold
}
set edit:rprompt = { styled " "(date +"%H:%M:%S")" " inverse }
fn ls {|@args|
	e:ls ^
		-1AFah ^
		--color=auto ^
		--group-directories-first ^
		$@args
}
fn grep {|@args| e:grep --color=auto $@args }
fn bat {|@args|
	e:bat ^
		--paging never ^
		--italic-text always ^
		$@args
}
fn file {|@args| e:file -F " :" $@args }
fn tree {|@args|
	e:tree ^
		-ACFa ^
		--dirsfirst ^
		--gitignore ^
		--noreport ^
		$@args
}
fn hx {|@args| e:helix $@args }
set paths = [$@paths $E:HOME"/.local/bin"]
set E:LC_ALL = "en_CA.UTF-8"
