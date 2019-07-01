function gcfu
	set -l shortCommit (git rev-parse --short head)
	git commit --fixup=$shortCommit
end