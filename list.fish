function list -a PROJ
  set -g FILE ~/.config/fish/data/savedata.json
  if [ "$PROJ" = "" ]
    cat $FILE | jq
    return 0
  end
  cat $FILE | jq ".$PROJ"
end