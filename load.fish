function load -a PROJ
  set -g THIS_DIR (pwd)
  if [ "$PROJ" = "" ]
    set_color red
    echo "    ERR! Please enter a name for the load."
    return 1
  end
  set -g FILE ~/.config/fish/data/savedata.json
  if not [ -e $FILE ]
    set_color red
    echo "    ERR! No savedata found. Make sure you save before loading."
    return 1
  end
  set_color yellow
  echo "    * LOADING $PROJ from $FILE"
  
  for DIR in (cat $FILE | jq ".$PROJ" | jq -r 'keys[]')
    cd $DIR
    set -g THIS_BRANCH (__git_branch_name)
    set_color "#FFE0E8"
    echo "    IN $DIR"
    set -g REQ_BRANCH (cat $FILE | jq -r ".$PROJ.\"$DIR\"")
    if [ "$THIS_BRANCH" != "$REQ_BRANCH" ]
      echo CHEKING OUT "$REQ_BRANCH"
      git checkout $REQ_BRANCH
    else
      echo BRANCH ALREADY CHECKED OUT
    end
  end
  cd $THIS_DIR

end