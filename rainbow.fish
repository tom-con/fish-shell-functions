function rainbow -a STR
  set ACC
  set COLORS "DCADFF" "A79EE8" "B9CFFF" "9ED6E8" "A8FFED" "86E880" "D4FF87"
  set LENGTH (count $COLORS)
  set POS (math 1 + 0)
  set REVERSE 0
  for LETTER in (echo "$STR" | string split "")
    set ACC "$ACC"(set_color $COLORS[$POS])"$LETTER"
    if [ "$POS" = "$LENGTH" ]
      set REVERSE 1
    end
    if [ "$POS" = 1 ]
      set REVERSE 0
    end
    if [ "$REVERSE" = 1 ]
      set POS (math "$POS-1")
    else
      set POS (math "$POS+1")
    end
  end
  echo "$ACC"
end