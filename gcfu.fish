function gcfu
	set -l shortCommit (git rev-parse --short HEAD)
	git commit --fixup=$shortCommit
end