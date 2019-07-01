function delete -a PROJ
  set -g FILE ~/.config/fish/data/savedata.json
  if [ "$PROJ" = "" ]
    set_color red
    echo "    ERR! Need to specify a saved project to delete"
    return 1
  end
  set_color yellow
  echo "    Deleting saved project: $PROJ"
  cat $FILE | jq ".$PROJ"
  echo (cat $FILE | jq "del(.$PROJ)") > $FILE
end