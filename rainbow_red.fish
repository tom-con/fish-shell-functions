function rainbow_red -a STR
  set ACC
  set COLORS "FFF366" "E8BF5D" "FFB373" "E8705D" "FF78C6" "C066E8" "9082FF"
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