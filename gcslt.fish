function gcslt
   git log (git describe --abbrev=0 --tags)..HEAD --oneline --no-merges
end
