function save -a PROJ
  if [ "$PROJ" = "" ]
    set_color red
    echo "    ERR! Please enter a name for the save."
    return 1
  end
  set_color yellow
  set -g FILE ~/.config/fish/data/savedata.json
  if not [ -e $FILE ]
    touch $FILE
    echo '{}' | jq > $FILE
  end
  set -g BRANCH (__git_branch_name)
  set -g DIR (pwd)
  echo "    🦑  🦑  🦑  🦑  🦑  🦑  🦑  🦑  🦑  🦑  🦑  🦑"
  echo "    * Saving $BRANCH for $DIR as \"$PROJ\"."
  echo "    * Use `load $PROJ` to quickly get this branch again"
  echo "    🦀  🦀  🦀  🦀  🦀  🦀  🦀  🦀  🦀  🦀  🦀  🦀"
  set -g NEW_PATH "setpath([\"$PROJ\",\"$DIR\"]; \"$BRANCH\")"
  set -g JSON (cat $FILE | jq (echo $NEW_PATH) )
  echo $JSON > $FILE
  set_color green
  echo "    ** CURRENT SAVE STATUS FOR $PROJ: **"
  cat $FILE | jq ".$PROJ"
end