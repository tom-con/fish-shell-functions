function gbdo -d "git branch delete older than..." -a weeks
  echo "This will delete all branches that have not received a commit in $weeks weeks"
  __get_confirm
  if [ $status -eq 0 ]
    set -l weeksAgo $weeks' weeks ago'
    for branch in (git branch | sed /\*/d)
      set -l trimmed (string trim -- $branch)  
      set -l commits (git log -1 --oneline --since=$weeksAgo -s $trimmed)
      if [ -z (echo $commits) ]
        echo "DELETING: $trimmed"
        git branch -D $trimmed
      end
    end
  end
end